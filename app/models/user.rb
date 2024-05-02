class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  has_many :recipes
  has_many :reviews

  # Validations
  validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
  validates :email, presence: true, uniqueness: true

  # Methods
end
