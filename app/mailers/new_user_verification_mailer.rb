class NewUserVerificationMailer < ApplicationMailer
    default from: 'ruby@ruby.com'


    def verification_email
    
        @user  = params[:user];
        @url =  "localhost:3000/email/verify/#{@user.id}"
        mail(to: @user.email, subject: 'Verification Email')
    end
end
