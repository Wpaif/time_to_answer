class Question < ApplicationRecord
  belongs_to :subject

  scope :desc_order, -> { order(created_at: :desc) }
  
  # Kaminari
  paginates_per 15
end
