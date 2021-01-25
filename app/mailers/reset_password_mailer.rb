class ResetPasswordMailer < ApplicationMailer
    default from: 'ruby@rubypost.com'

    def reset_password
        @user  = params[:user]
        @token = params[:token]
    end
end
