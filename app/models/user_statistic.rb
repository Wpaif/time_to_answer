class UserStatistic < ApplicationRecord
  belongs_to :user

  # Virtual Attributes
  def total_questions
    right_questions + wrong_questions
  end

  # Class Method
  def self.assing_statistic(answer, current_user)
    if !!current_user
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      answer.correct? ? user_statistic.right_questions += 1 : user_statistic.wrong_questions += 1

      user_statistic.save
    end
  end
end
