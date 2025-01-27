class Produto < ApplicationRecord
  belongs_to :categoria

  validates :nome, presence: true
  validates :slug, uniqueness: true
  validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true  

  enum status: { ativo: 'ativo', inativo: 'inativo' }

  scope :ativos, -> { where(status: :ativo) }
  scope :inativos, -> { where(status: :inativo) }

  before_create :set_default_status  

  before_save :generate_slug

  private

  def set_default_status
    self.status ||= :ativo
  end

  def generate_slug
    self.slug = nome.to_s.parameterize
  end
end