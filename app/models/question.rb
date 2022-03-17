class Question < ApplicationRecord
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  # Callbacks
  after_create :set_statistic

  # Scopes
  scope :search_subject, lambda { |subject_id, page_number|
    Question.includes(:answers, :subject)
            .where(subject_id: subject_id)
            .desc_order
            .paginate(page_number)
  }

  scope :search_question, lambda { |term, page_number|
    Question.includes(:answers, :subject)
            .where('lower(description) LIKE ?', "%#{term.downcase}%")
            .desc_order
            .paginate(page_number)
  }

  scope :last_questions, lambda { |page_number|
    Question.includes(:answers, :subject)
            .desc_order
            .paginate(page_number)
  }

  scope :desc_order, -> { order(created_at: :desc) }

  scope :paginate, ->(page_number) { page(page_number) }

  # Kaminari
  paginates_per 15

  private

  def set_statistic
    AdminStatistic.assing_event(AdminStatistic::EVENTS[:total_questions])
  end
end
