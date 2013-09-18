class LinksController < ApplicationController

  def new
  end

  def create
    params[:link][:poster_id] = current_user.id
    @link = Link.new(params[:link])

    if @link.save
      redirect_to link_url(@link.id)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if current_user.id == @link.poster_id
      if @link.update_attributes(params[:link])
        redirect_to link_url(params[:id])
      else
        flash[:errors] = @link.error.full_messages
        render :new
      end
    else
      flash[:error] = ["Only the original poster may edit subs."]
    end
  end

  def destroy
  end

  def index
  end

  def show
    @link = Link.find(params[:id])
  end

end
