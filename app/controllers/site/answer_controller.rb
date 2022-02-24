class Site::AnswerController < SiteController
  def question
    @answer = Answer.find(params[:answer_id]) if params[:answer_id]
    assing_user_statistic(@answer)
  end

  private

  def assing_user_statistic(answer)
    if user_signed_in?
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      answer.correct? ? user_statistic.right_questions += 1 : user_statistic.wrong_questions += 1

      user_statistic.save
    end
  end
end
