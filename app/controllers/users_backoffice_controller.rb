class UsersBackofficeController < ApplicationController
  before_action :authenticate_user!
  before_action :build_profile
  before_action :check_pagination
  layout 'users_backoffice'

  private

  def build_profile
    current_user.build_user_profile if current_user.user_profile.blank?
  end

  def check_pagination
    params.extract!(:page) unless user_signed_in?
  end
end
