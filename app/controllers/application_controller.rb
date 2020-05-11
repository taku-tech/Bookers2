class ApplicationController < ActionController::Base
	# nameのデータ操作を可能にする設定
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	def after_sign_in_path_for(resorce)
		books_path
	end

	def after_sign_up_path_for(resource)
		books_path
	end


	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		end
end
