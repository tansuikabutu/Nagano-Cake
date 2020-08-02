class ApplicationController < ActionController::Base
end


   def after_sign_up_path_for(resource)
    items_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :first_name_kana, :last_name, :last_name_kana, :postcode, :address, :phone_number, :email ])
  end
