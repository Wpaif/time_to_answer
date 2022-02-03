class Site::SearchController < SiteController
  def question
    @questions = Question.includes(:answers).where('lower(description) LIKE ?',
                                                   "%#{params[:term].downcase}%").page(params[:page])
  end
end
