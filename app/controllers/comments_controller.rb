class CommentsController < ApplicationController
before_action :find_video
before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
before_action :comment_owner, only: [:destroy, :edit, :update]

  def create
    @comment = @video.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to video_path(@video)
    else
      render 'new'
    end

  end

  def destroy
    @comment.destroy
    redirect_to video_path(@video)
  end

  def edit

  end

  def update 
    if @comment.update(params[:comment].permit(:content))
      redirect_to video_path(@video)
    else
      render'edit'
    end
  end


  private

  def find_video
    @video = Video.find(params[:video_id])
  end

  def find_comment
    @comment = @video.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "Accès refusé, petit malin !"
      redirect_to @video
    end
  end

end
