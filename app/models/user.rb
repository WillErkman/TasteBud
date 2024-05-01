class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations

  # Validations
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }

  # Methods
end
