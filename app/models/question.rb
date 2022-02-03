class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  scope :desc_order, -> { order(:created_at) }

  # Kaminari
  paginates_per 5
end
