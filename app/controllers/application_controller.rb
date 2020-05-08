class ApplicationController < ActionController::Base
	# nameのデータ操作を可能にする設定
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, key: [:name])
		end
end
