class Equipment < ApplicationRecord
  KINDS = %w(Type1 Type2 Type3)

  belongs_to :organization

  validates :name, :kind, :serial_number, presence: true
  validates :serial_number, uniqueness: true

  def kinds
    KINDS
  end
end
