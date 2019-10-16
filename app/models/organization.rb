class Organization < ApplicationRecord
  LEGAL_FORMS = %w(ООО ОАО АО ИП)

  validates :name, :legal_form, :inn, :ogrn, presence: true

  def legal_forms
    LEGAL_FORMS
  end
end
