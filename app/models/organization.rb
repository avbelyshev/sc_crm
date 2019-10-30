class Organization < ApplicationRecord
  include PgSearch::Model

  LEGAL_FORMS = %w(ООО ОАО АО ИП)

  has_many :equipments, dependent: :destroy
  has_many :clients_organizations, dependent: :destroy
  has_many :clients, through: :clients_organizations

  validates :name, :legal_form, :inn, :ogrn, presence: true
  validates :inn, uniqueness: true

  pg_search_scope :search_by, against: %i[name inn ogrn], using: {
    tsearch: { prefix: true }
  }

  def self.search(query)
    return [] unless query
    search_by("#{query}")
  end

  def legal_forms
    LEGAL_FORMS
  end
end
