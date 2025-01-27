class CategoriaSerializer < ActiveModel::Serializer
  attributes  :slug, :nome
  has_many :produtos, if: :include_produtos?

  def include_produtos?
    @instance_options[:include_produtos]
  end
end