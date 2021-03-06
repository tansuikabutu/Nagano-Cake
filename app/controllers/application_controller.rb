class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
add_flash_types :success, :info, :warning, :danger



protected
    def after_sign_in_path_for(resource)
      case resource
      when Admin
        admins_top_path
      when Member
        member_top_path
      end
    end


    def after_sign_out_path_for(resource)
    	if resource == :admin
      new_admin_session_path
      else
      root_path
      end
    end



#deviseのストロングパラメーターにカラム追加するメソッドを定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_status, :first_name, :first_name_kana, :last_name,:last_name_kana,:postcode,:address,:phone_number,:email ])
  end

end