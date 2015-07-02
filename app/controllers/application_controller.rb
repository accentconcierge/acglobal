class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :country_code, :phone_number,:home_adress,:work_address, :email, :password, :stripe_card_token) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :country_code, :phone_number,:home_adress,:work_address, :email, :password, :current_password, :stripe_card_token) }
        end

        	def after_sign_in_path(resource)
						dashboard_path
					end

					def after_sign_out_path(resource)
						root_path
					end
 

end
