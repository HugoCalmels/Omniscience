class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(video_params)

    if @video.save
      redirect_to @video
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      redirect_to @video
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])

    @video.destroy
    redirect_to :action => index
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :category_id, :clip, :thumbnail)
  end
end
