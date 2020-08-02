class ApplicationController < ActionController::Base


   def after_sign_in_path_for(resource)
      case resource
      when Admin
        admins_top_path
      when Member
        member_top_path
      end
   end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :first_name_kana, :last_name, :last_name_kana, :postcode, :address, :phone_number, :email ])
  end

end