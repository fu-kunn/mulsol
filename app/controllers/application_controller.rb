class ApplicationController < ActionController::Base
  protected
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :company_name_kana, :post_code, :address,:first_name, :last_name, :first_name_kana, :last_name_kana, :tel])
  end
end
