class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  scope :search_question, lambda { |term, page_number|
    Question.includes(:answers)
            .where('lower(description) LIKE ?', "%#{term.downcase}%")
            .desc_order
            .paginate(page_number)
  }

  scope :last_questions, lambda { |page_number|
    Question.includes(:answers)
            .desc_order
            .paginate(page_number)
  }

  scope :desc_order, -> { order(created_at: :desc) }

  scope :paginate, ->(page_number) { page(page_number) }

  # Kaminari
  paginates_per 5
end
