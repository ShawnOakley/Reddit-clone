class CommentsController < ApplicationController

  def create

    @comment = Comment.new(params[:comment])

    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end
end
