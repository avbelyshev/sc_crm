class Organization < ApplicationRecord
  LEGAL_FORMS = {
    ooo: 'ООО',
    oao: 'ОАО',
    ao: 'АО',
    ip: 'ИП',
  }

  validates :name, :legal_form, :inn, :ogrn, presence: true
end
