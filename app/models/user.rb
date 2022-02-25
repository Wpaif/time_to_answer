class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank

  # Callbacks
  after_create :set_statistic

  # Validations
  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }, on: :update
  validates :last_name, presence: true, length: { minimum: 2 }, on: :update

  # Virtual Attributes
  def full_name
    [first_name, last_name].join(' ')
  end

  private

  def set_statistic
    AdminStatistic.assing_event(AdminStatistic::EVENTS[:total_users])
  end
end
