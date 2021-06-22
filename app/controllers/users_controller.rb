class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @user_videos = @user.videos
  end

  def index
  end
end
