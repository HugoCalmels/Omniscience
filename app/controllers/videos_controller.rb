class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @categories = Category.all
    
    cate = params[:cate]     
    if !cate.nil?       
      @videos = Video.where( :category_id => cate)
 
    else  
     @videos = Video.all     
    end   
  end

  def show
    @video = Video.find(params[:id])
    @comments = Comment.where(video_id: @video).order("created_at DESC")
    
  end

  def new
    @video = current_user.videos.build
  end

  def create
    @video = current_user.videos.build(video_params)


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
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :category_id, :clip, :thumbnail, :user_id)
  end

  
end
