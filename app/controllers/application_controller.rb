class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

protected
   def after_sign_up_path_for(resource)
    items_path
  end


#deviseのストロングパラメーターにカラム追加するメソッドを定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_status, :first_name, :first_name_kana, :last_name,:last_name_kana,:postcode,:address,:phone_number,:email ])
  end

end