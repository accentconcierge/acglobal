class RegistrationsController <ApplicationController


	def after_sign_in_path(resource)
		dashboard_path
	end

	def after_sign_out_path(resource)
		root_path
	end
	


end
