class ProdutoSerializer < ActiveModel::Serializer
  attributes :slug, :nome, :descricao, :preco, :status
  has_one :categoria
end