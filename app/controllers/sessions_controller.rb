class SessionsController < ApplicationController
  
  def new
    if current_user
      @user = current_user.username
      redirect_to post_index_path(@user)
      #post_path(@user)
      #
    else
      @user  = User.new
    end
  end

  def create
    user = User.authenticate(
      :email => user_params[:email], 
      :password => user_params[:password_hash]
    )
    
    if user
      #WelcomeNewUserJob.set(wait: 10.minutes).perform_later(user)
      ActiveSupport::Notifications.instrument "event" , { foo: "bar" }
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Successfully logged in"
      
    else
      flash[:alert]  = "Invalid email or password"
      redirect_to action: :new
    end
  end

  def logout
    session.delete(:current_user)
    session[:user_id] = nil
    redirect_to root_path, :notice => "Successfully logged out"
  end

  def user_params
    params.require(:user).permit(:email, :password_hash,)
  end

  private :user_params

end
