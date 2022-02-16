class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }, on: :update
  validates :last_name, presence: true, length: { minimum: 2 }, on: :update

  # Virtual Attributes
  def full_name
    [first_name, last_name].join(' ')
  end
end
