require 'rails_helper'

RSpec.describe Categoria, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:produtos).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_uniqueness_of(:nome) }
    it { is_expected.to validate_uniqueness_of(:slug) }
  end

  describe 'callbacks' do
    it 'generates a slug before saving' do
      categoria = Categoria.new(nome: 'Nova Categoria')
      expect(categoria.slug).to be_nil

      categoria.save
      expect(categoria.slug).to eq('nova-categoria')
    end

    it 'updates the slug if the nome changes' do
      categoria = Categoria.create(nome: 'Categoria Original')
      original_slug = categoria.slug

      categoria.update(nome: 'Categoria Alterada')
      expect(categoria.slug).not_to eq(original_slug)
      expect(categoria.slug).to eq('categoria-alterada')
    end

    it 'does not change the slug if the nome remains the same' do
      categoria = Categoria.create(nome: 'Categoria Fixa')
      slug_inicial = categoria.slug

      categoria.update(nome: 'Categoria Fixa')
      expect(categoria.slug).to eq(slug_inicial)
    end
  end
end
