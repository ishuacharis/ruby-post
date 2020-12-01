class SessionsController < ApplicationController
  
  def new
    @user  = User.new
  end

  def create
    user = User.authenticate(user_params[:email], user_params[:password_hash])
    
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Successfully logged in"
      
    else
      flash.now.alert  = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Successfully logged out"
  end

  def user_params
    params.require(:user).permit(:email, :password_hash,)
  end

  private :user_params

end
