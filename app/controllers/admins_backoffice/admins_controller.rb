class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: %i[edit update destroy]
  before_action :check_password, only: %i[update]

  def index
    @admins = Admin.all.page(params[:page])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admins_backoffice_admins_path,
                  notice: t('notice.admin_backoffice.create', entity: t('activerecord.models.admin.one'), gender: 'o')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @admin.update(admin_params)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to admins_backoffice_admins_path,
                  notice: t('notice.admin_backoffice.update', entity: t('activerecord.models.admin.one'), gender: 'o')
    else
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      redirect_to admins_backoffice_admins_path,
                  notice: t('notice.admin_backoffice.delete', entity: t('activerecord.models.admin.one'), gender: 'o')
    else
      render :index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def check_password
    if params[:admin][:password].blank? &&
       params[:admin][:password_confirmation].blank?

      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end
