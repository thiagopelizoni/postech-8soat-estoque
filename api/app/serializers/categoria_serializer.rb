class CategoriaSerializer < ActiveModel::Serializer
  attributes :id, :nome, :slug
  has_many :produtos
end