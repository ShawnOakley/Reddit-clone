class SubsController < ApplicationController

  def new
  end

  def create
    begin
      @user_id = current_user.id

      ActiveRecord::Base.transaction do

        params[:sub][:moderator_id] = @user_id
        @sub = Sub.new(params[:sub])

        @links = params[:links].values.map do |link_params|
          Link.new(link_params)
        end

        @sub.save

        @links.each do |link|
          link.poster_id = @user_id
          link.save
          LinkSub.new(link_id: link.id, sub_id: @sub.id).save
        end



        raise "invalid" unless @sub.valid?
      end
    rescue
      flash[:errors] = @sub.errors + @links.map(&:errors).flatten
      render :new
    else
      redirect_to subs_url
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])

    if current_user.id == @sub.moderator_id
      if @sub.update_attributes(params[:sub])
        redirect_to sub_url(params[:id])
      else
        flash[:errors] = @sub.error.full_messages
        render :new
      end
    else
      flash[:error] = ["Only moderators may edit subs."]
    end
  end

  def destroy
  end

  def index
  end

  def show
    @sub = Sub.find(params[:id])
  end

end
