class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, { if: :devise_controller? }

	def authorize_user
		unless current_user
		  flash[:message] = 'Please log in or register to access this page'

		  redirect_to root_path
		end
	end


	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up).push :name
	end
end
