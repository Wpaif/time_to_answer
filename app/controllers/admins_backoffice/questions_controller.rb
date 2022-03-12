class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :set_question, only: %i[edit update destroy]
  before_action :search_all_subjects, only: %i[edit new]

  def index
    respond_to do |format|
      format.html { @questions = Question.includes(:subject).page(params[:page]) }
      format.pdf { @questions = Question.includes(:subject) }
      format.json { @questions = Question.includes(:subject, :answers) }
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to admins_backoffice_questions_path,
                  notice: t('notice.admin_backoffice.create', entity: t('activerecord.models.question.one'),
                                                              gender: 'a')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admins_backoffice_questions_path,
                  notice: t('notice.admin_backoffice.update', entity: t('activerecord.models.question.one'),
                                                              gender: 'a')
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to admins_backoffice_questions_path,
                  notice: t('notice.admin_backoffice.delete', entity: t('activerecord.models.question.one'),
                                                              gender: 'a')
    else
      render :index
    end
  end

  private

  def question_params
    params.require(:question).permit(:description, :subject_id, answers_attributes: %i[id description correct _destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def search_all_subjects
    @subjects = Subject.all
  end
end
