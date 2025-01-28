require 'rails_helper'

RSpec.describe Produto, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:categoria) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_uniqueness_of(:slug) }
    it { is_expected.to validate_presence_of(:preco) }
    it { is_expected.to validate_numericality_of(:preco).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'enums' do
    it 'defines status enum with expected values' do
      expect(Produto.statuses.keys).to match_array(%w[ativo inativo])
      expect(Produto.statuses['ativo']).to eq(1)
      expect(Produto.statuses['inativo']).to eq(0)
    end
  end

  describe 'scopes' do
    let!(:produto_ativo) { create(:produto, status: :ativo) }
    let!(:produto_inativo) { create(:produto, status: :inativo) }

    it 'returns only active products with the :ativos scope' do
      expect(Produto.ativos).to include(produto_ativo)
      expect(Produto.ativos).not_to include(produto_inativo)
    end

    it 'returns only inactive products with the :inativos scope' do
      expect(Produto.inativos).to include(produto_inativo)
      expect(Produto.inativos).not_to include(produto_ativo)
    end
  end

  describe 'callbacks' do
    context 'before_create' do
      it 'sets default status to ativo if not provided' do
        produto = build(:produto)
        produto.save
        expect(produto.status).to eq('ativo')
      end

      it 'does not override a provided status' do
        produto = build(:produto, status: 0)
        produto.save
        expect(produto.status).to eq('inativo')
      end
    end

    context 'before_save' do
      it 'generates a slug based on nome' do
        produto = build(:produto, nome: 'Produto Teste')
        produto.save
        expect(produto.slug).to eq('produto-teste')
      end

      it 'updates the slug when nome changes' do
        produto = create(:produto, nome: 'Produto Original')
        original_slug = produto.slug

        produto.update(nome: 'Novo Nome do Produto')
        expect(produto.slug).not_to eq(original_slug)
        expect(produto.slug).to eq('novo-nome-do-produto')
      end

      it 'does not change the slug if nome remains the same' do
        produto = create(:produto, nome: 'Produto Fixo')
        slug_inicial = produto.slug

        produto.update(nome: 'Produto Fixo') # Nome não mudou
        expect(produto.slug).to eq(slug_inicial)
      end
    end
  end
end
