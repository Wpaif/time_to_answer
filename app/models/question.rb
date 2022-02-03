class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  def self.search_question(term, page_number)
    Question.includes(:answers)
            .where('lower(description) LIKE ?', "%#{term.downcase}%")
            .desc_order
            .page(page_number)
  end

  def self.last_questions(page_number)
    Question.includes(:answers).desc_order.page(page_number)
  end
  scope :desc_order, -> { order(created_at: :desc) }

  # Kaminari
  paginates_per 5
end
