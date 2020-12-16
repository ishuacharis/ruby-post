class ApplicationController < ActionController::Base
    helper_method :current_user, :username
    add_flash_types :error

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def username
        current_user.username
    end
end
