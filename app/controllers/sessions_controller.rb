class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.has_password?(
    params[:user][:username],
    params[:user][:password]
    )

    if @user.nil?
      flash[:errors] = ["Username or password incorrect."]
    else
      self.current_user = @user
      redirect_to user_url(@user)
    end
  end

  def destroy
    logout_current_user!
    redirect_to new_session_url
  end

end
