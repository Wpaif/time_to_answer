class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: %i[edit update destroy]

  def index
    respond_to do |format|
      format.html { @subjects = Subject.all.page(params[:page]) }
      format.pdf { @subjects = Subject.all }
    end
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to admins_backoffice_subjects_path,
                  notice: t('notice.admin_backoffice.create', entity: t('activerecord.models.subject.one'), gender: 'o')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subject.update(subject_params)
      redirect_to admins_backoffice_subjects_path,
                  notice: t('notice.admin_backoffice.update', entity: t('activerecord.models.subject.one'), gender: 'o')
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      redirect_to admins_backoffice_subjects_path,
                  notice: t('notice.admin_backoffice.delete', entity: t('activerecord.models.subject.one'), gender: 'o')
    else
      render :index
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:description)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end
end
