class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    "/user/#{current_user.id}"
  end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
