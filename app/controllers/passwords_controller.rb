class PasswordsController < ApplicationController

    def new
        @password  = Password.new
    end

    def create
        email = params[:password][:email]
        if email.blank?
            flash[:error] = 'Email not present'
            redirect_to action: :new

        else
            user = User.find_by(email: email.downcase)

            if user.present? && user.created_at
                password = Password.new
                token = password.generate_password_token
                new_password =  Password.new(email: email,token: token)
                #send token to email
                if new_password.save
                    redirect_to password_reset_new_path, :notice => "Please enter token"
                else
                    flash[:error] = 'Unable to generate token'
                    redirect_to action: :new
                end
                
            else
                flash[:error] = 'Please register an account'
                redirect_to action: :new
            end
        end
    end

    def reset_password
    end

    def reset
        token = params[:token].to_s
        email = params[:email]
        password =  params[:password]
        if email.blank?
            redirect_to password_reset_new_path, :error => "Email not present"
        else
            db_token = Password.find_by(token: token,)
            if db_token.present? && db_token.password_token_valid?
                if db_token.set_token.nil?
                    user = User.find_by(email: email)
                    if user.present?
                        user.password_hash =  password
                        user.save
                        redirect_to root_path
                    else
                        redirect_to password_forgot_new_path, :notice => "Please verify your email"
                    end
                else
                    redirect_to password_reset_new_path, :error => "Internal server error"
                end
            else
                redirect_to password_reset_new_path, :error => "Please check token"
            end
        end
    end

    def update_password
    end

    def update
        password = params[:password]
        if !password.present?
            redirect_to password_update_new_path, :notice => "Password not present"
        end
        user = User.find_by(email: current_user.email)
        if user.exist?
            user.password_hash = password
            user.save
            redirect_to root_path, :notice => "password updated"
        else
            redirect_to update_password_new_path, :error => "Please check your email"
        end
    end
end
