class Categoria < ApplicationRecord
  has_many :produtos, dependent: :destroy

  validates :nome, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  before_save :generate_slug

  private

  def generate_slug
    self.slug = nome.to_s.parameterize
  end
end
