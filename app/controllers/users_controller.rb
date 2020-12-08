class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path,  :notice => "Account created"
      else
        flash.now[:error] = "Unable to create new account"
        render :new
    end

  end


  def user_params
    params.require(:user).permit(:username, :email, :password_hash)
  end

  private :user_params
end
