class ApplicationMailer < ActionMailer::Base
  default from: "hi@auction-site.com"
  layout 'mailer'

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Welcome, #{@user.name}")
  end
end
