class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)

    if @user.save
      WelcomeMailer.with(user: user).welcome_email.deliver_now
      redirect_to root_path,  :notice => "Account created"
      else
        redirect_to new_user_path, flash: {error:  @user.errors}
    end

  end

  def edit
    @user  =  User.find_by_username(params[:id])
    
  end

  def update
    @user =  User.find_by_username(params[:id])

    if params[:avatar].present?
      @user.avatar.attach(params[:avatar])
    end 

    if @user.update(update_user_params)
      redirect_to root_path
    else
      flash.now[:error] = "Unable to update profile"
      render :edit
    end
  end


  def new_user_params
    params.require(:user).permit(:username, :email, :password_hash)
  end

  def update_user_params
    params.require(:user).permit(:fullname, :location, :bio, :avatar)
  end
  private :new_user_params, :update_user_params
end
