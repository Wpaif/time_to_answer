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

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      redirect_to admins_backoffice_subjects_path, notice: 'Subject Successfully Updated'
    else
      render :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:id])

    if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: 'Subject Successfully Deleted'
    else
      render :index
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:description)
  end
end
