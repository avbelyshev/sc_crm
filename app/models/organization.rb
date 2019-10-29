class Organization < ApplicationRecord
  LEGAL_FORMS = %w(ООО ОАО АО ИП)

  has_many :equipments, dependent: :destroy
  has_many :clients_organizations, dependent: :destroy
  has_many :clients, through: :clients_organizations

  validates :name, :legal_form, :inn, :ogrn, presence: true
  validates :inn, uniqueness: true

  def legal_forms
    LEGAL_FORMS
  end
end
