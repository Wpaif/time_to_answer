class Question < ApplicationRecord
  belongs_to :subject
  has_many :answers

  accepts_nested_attributes_for :answers

  scope :desc_order, -> { order(:description) }

  # Kaminari
  paginates_per 15
end
