class AdminsBackoffice::AdminsController < AdminsBackofficeController
  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])

    remove_fied_passwords

    if @admin.update(admin_params)
      redirect_to admins_backoffice_admins_path, notice: 'Admin Successfully Updated'
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def remove_fied_passwords
    if params[:admin][:password].blank? &&
       params[:admin][:password_confirmation].blank?
       
      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end
