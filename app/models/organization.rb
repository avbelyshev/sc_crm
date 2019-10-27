class Organization < ApplicationRecord
  LEGAL_FORMS = %w(ООО ОАО АО ИП)

  has_many :equipments, dependent: :destroy

  validates :name, :legal_form, :inn, :ogrn, presence: true
  validates :inn, uniqueness: true

  def legal_forms
    LEGAL_FORMS
  end
end
