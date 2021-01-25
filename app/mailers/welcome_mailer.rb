class WelcomeMailer < ApplicationMailer
    default from: 'notification@localhost.co.uk'

    def welcome_email
        @user  = params[:user]
        @url  =  'http://www.localhost.com'
        mail(to: @user.email, subject: 'Welcome to to this website')
    end
end
