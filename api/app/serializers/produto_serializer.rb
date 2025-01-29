class ProdutoSerializer < ActiveModel::Serializer
  attributes :id, :slug, :nome, :descricao, :preco, :status
  has_one :categoria
end