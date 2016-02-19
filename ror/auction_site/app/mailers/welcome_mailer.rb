class WelcomeMailer < ApplicationMailer
	def create
		@user = current_user

		WelcomeMailer.welcome_email(@user).deliver_now

		redirect_to '/'
	end
end
