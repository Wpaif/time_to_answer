class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to admins_backoffice_subjects_path, notice: 'Subject Successfully Created'
    else
      render :new
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:description)
  end
end
