class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@user_videos = @user.videos
    @user_videos = Video.where(user_id: params[:id]) 
  end

  def index
  end
  
end
