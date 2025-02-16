require 'swagger_helper'

RSpec.describe 'Categorias API', type: :request do
  path '/categorias' do
    get 'Listar Categorias' do
      parameter name: :page, in: :query, type: :integer, description: 'Número da página'
      parameter name: :per_page, in: :query, type: :integer, description: 'Número de itens por página'
      tags 'Categorias'
      produces 'application/json'

      response '200', 'categorias encontradas' do
        schema type: :array,
               items: { '$ref' => '#/components/schemas/categoria' }
      end
    end

    post 'Criar Categoria' do
      tags 'Categorias'
      consumes 'application/json'
      parameter name: :categoria, in: :body, schema: {
        type: :object,
        properties: {
          nome: { type: :string },
          slug: { type: :string }
        },
        required: ['nome', 'slug']
      }

      response '201', 'categoria criada' do
        schema '$ref' => '#/components/schemas/categoria'

        let(:categoria) { { nome: 'Lanches', slug: 'lanches' } }
      end

      response '422', 'categoria não criada' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   additionalProperties: { type: :array, items: { type: :string } }
                 }
               }

        let(:categoria) { { nome: '', slug: '' } }
      end
    end
  end

  path '/categorias/{slug}' do
    get 'Exibir uma Categoria' do
      tags 'Categorias'
      produces 'application/json'
      parameter name: :slug, in: :path, type: :string, required: true

      response '200', 'categoria encontrada' do
        schema '$ref' => '#/components/schemas/categoria'

        let(:slug) { Categoria.create!(nome: 'Lanches', slug: 'lanches').slug }
        
      end

      response '404', 'categoria não encontrada' do
        let(:slug) { 'invalid' }
      end
    end

    put 'Atualizar uma Categoria' do
      tags 'Categorias'
      consumes 'application/json'
      parameter name: :slug, in: :path, type: :string, required: true
      parameter name: :categoria, in: :body, schema: {
        type: :object,
        properties: {
          nome: { type: :string },
          slug: { type: :string }
        },
        required: ['nome', 'slug']
      }

      response '200', 'categoria atualizada' do
        schema '$ref' => '#/components/schemas/categoria'

        let(:slug) { Categoria.create!(nome: 'Lanches', slug: 'lanches').slug }
        let(:categoria) { { nome: 'Lanches Atualizados', slug: 'lanches-atualizados' } }
      end

      response '404', 'categoria não encontrada' do
        let(:slug) { 'invalid' }
      end

      response '422', 'categoria não atualizada' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   additionalProperties: { type: :array, items: { type: :string } }
                 }
               }

        let(:slug) { Categoria.create!(nome: 'Lanches', slug: 'lanches').slug }
        let(:categoria) { { nome: '', slug: '' } }
      end
    end
  end
end
