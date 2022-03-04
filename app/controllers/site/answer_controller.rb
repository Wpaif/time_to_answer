class Site::AnswerController < SiteController
  def question
    @answer = Answer.find(params[:answer_id]) if params[:answer_id]

    UserStatistic.assing_statistic(@answer, current_user)
  end
end
