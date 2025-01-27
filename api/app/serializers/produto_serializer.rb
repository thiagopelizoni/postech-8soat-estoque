class ProdutoSerializer < ActiveModel::Serializer
  attributes :id, :nome, :slug, :descricao, :preco, :status
  has_one :categoria
end