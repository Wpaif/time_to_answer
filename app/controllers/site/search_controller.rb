class Site::SearchController < SiteController
  def question
    @questions = Question.includes(:answers)
                         .where('lower(description) LIKE ?', "%#{params[:term].downcase}%")
                         .desc_order
                         .page(params[:page])
  end
end
