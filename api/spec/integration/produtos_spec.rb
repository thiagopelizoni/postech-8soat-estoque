# spec/integration/produtos_spec.rb
require 'swagger_helper'

RSpec.describe 'Produtos API', type: :request do
  path '/produtos' do
    get 'Listar Produtos' do
      parameter name: :page, in: :query, type: :integer, description: 'Número da página'
      parameter name: :per_page, in: :query, type: :integer, description: 'Número de itens por página'
      tags 'Produtos'
      produces 'application/json'

      response '200', 'produtos encontrados' do
        schema type: :array, items: { '$ref' => '#/components/schemas/produto' }
      end
    end

    post 'Criar Produto' do
      tags 'Produtos'
      consumes 'application/json'
      parameter name: :produto, in: :body, schema: {
        '$ref' => '#/components/schemas/produto'
      }

      response '201', 'produto criado' do
        schema '$ref' => '#/components/schemas/produto'

        let(:produto) { { nome: 'Hamburguer', slug: 'hamburguer', descricao: 'Hamburguer de carne com queijo', preco: 15.0, categoria_id: 1 } }
      end

      response '422', 'produto não criado' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   additionalProperties: { type: :array, items: { type: :string } }
                 }
               }

        let(:produto) { { nome: '', preco: '' } }
      end
    end
  end

  path '/produtos/{slug}' do
    get 'Busca um Produto pelo seu Slug' do
      tags 'Produtos'
      produces 'application/json'
      parameter name: :slug, in: :path, type: :string

      response '200', 'produto encontrado' do
        schema '$ref' => '#/components/schemas/produto'

        let(:slug) { Produto.create!(nome: 'Hamburguer', slug: 'hamburguer', descricao: 'Hamburguer de carne com queijo', preco: 15.0, categoria_id: 1).slug }
        
      end

      response '404', 'produto não encontrado' do
        let(:slug) { 'invalid' }
      end
    end

    path '/produtos/nome/{nome}' do
      get 'Busca Produtos por nome' do
        tags 'Produtos'
        produces 'application/json'
        parameter name: :nome, in: :path, type: :string, description: 'Nome do produto'

        response '200', 'Produtos encontrados' do
          schema type: :array, items: { '$ref' => '#/components/schemas/produto' }

          let(:nome) { 'ProdutoExemplo' }
        end

        response '404', 'Nenhum produto encontrado' do
          let(:nome) { 'NomeInexistente' }
        end
      end
    end

    put 'Atualizar Produto' do
      tags 'Produtos'
      consumes 'application/json'
      parameter name: :slug, in: :path, type: :string
      parameter name: :produto, in: :body, schema: {
        '$ref' => '#/components/schemas/produto'
      }

      response '200', 'produto atualizado' do
        schema '$ref' => '#/components/schemas/produto'

        let(:slug) { Produto.create!(nome: 'Hamburguer', slug: 'hamburguer', descricao: 'Hamburguer de carne com queijo', preco: 15.0, categoria_id: 1).slug }
        let(:produto) { { nome: 'Hamburguer Atualizado', slug: 'hamburguer-atualizado', descricao: 'Hamburguer de carne com queijo e bacon', preco: 20.0, categoria_id: 1 } }
        
      end

      response '404', 'produto não encontrado' do
        let(:slug) { 'invalid' }
      end

      response '422', 'produto não atualizado' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   additionalProperties: { type: :array, items: { type: :string } }
                 }
               }

        let(:slug) { Produto.create!(nome: 'Hamburguer', slug: 'hamburguer', descricao: 'Hamburguer de carne com queijo', preco: 15.0, categoria_id: 1).slug }
        let(:produto) { { nome: '', slug: '' } }
      end
    end
  end
end
