class Site::SearchController < SiteController
  def question
    @questions = Question.search_question(params[:term], params[:page])
  end
end
