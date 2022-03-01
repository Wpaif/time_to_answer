class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :check_pagination
  before_action :set_global_params

  private

  def layout_by_resource
    scope_name = resource_class.to_s.downcase.concat('_devise')
    devise_controller? ? scope_name : 'application'
  end

  def check_pagination
    params.extract!(:page) unless user_signed_in?
  end

  def set_global_params
    $global_params = params
  end
end
