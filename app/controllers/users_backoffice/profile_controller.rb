class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :set_user
  before_action :check_password, only: %i[update]

  def edit
    @user.build_user_profile if @user.user_profile.blank?
  end

  def update
    if @user.update(params_user)
      sign_in(@user, bypass: true)
      redirect_to users_backoffice_profile_path, notice: 'User Successfully Updated'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                 user_profile_attributes: %i[address gender birthdate])
  end

  def check_password
    if params[:user][:password].blank? &&
       params[:user][:password_confirmation].blank?

      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
