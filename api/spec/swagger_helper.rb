# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      components: {
        schemas: {
          produto: {
            type: :object,
            properties: {
              nome: { type: :string },
              descricao: { type: :string },
              preco: { type: :number },
              status: { 
                type: :string,
                enum: ['ativo', 'inativo']
              }
            },
            required: ['nome', 'preco']
          },
          categoria: {
            type: :object,
            properties: {
              nome: { type: :string }
            },
            required: ['nome']
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file
  config.openapi_format = :yaml
end
