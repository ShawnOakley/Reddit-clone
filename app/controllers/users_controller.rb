class UsersController < ApplicationController
  before_filter :require_current_user!, :except => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end

  end

  def new
    @user = User.new
  end

end
