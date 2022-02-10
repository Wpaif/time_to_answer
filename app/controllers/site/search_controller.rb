class Site::SearchController < SiteController
  def question
    @questions = Question.search_question(params[:term], params[:page])
  end

  def subject
    @questions = Question.search_subject(params[:subject_id], params[:page])
  end
end
