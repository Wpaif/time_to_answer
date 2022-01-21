class Question < ApplicationRecord
  belongs_to :subject

  scope :desc_order, -> { order(:description) }

  # Kaminari
  paginates_per 15
end
