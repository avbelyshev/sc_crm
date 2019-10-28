class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :clients_organizations, dependent: :destroy
  has_many :organizations, through: :clients_organizations

  validates :fullname, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, uniqueness: true
end
