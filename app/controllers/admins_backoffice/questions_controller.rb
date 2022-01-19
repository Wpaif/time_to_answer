class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  def index
    @questions = Question.all
  end
end
