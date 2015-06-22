class RegistrationsController <ApplicationController


	def after_sign_in_path(resource)
		'dashboard'
	end

	def after_sign_out_path(resource)
		'#'
	end
	


end
