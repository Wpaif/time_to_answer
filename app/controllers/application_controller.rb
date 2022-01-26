class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def layout_by_resource
    scope_name = resource_class.to_s.downcase.concat('_devise')
    devise_controller? ? scope_name : 'application'
  end
end
