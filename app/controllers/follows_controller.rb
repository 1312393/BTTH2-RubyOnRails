class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end
  end

  def show
    respond_with(@follow)
  end

  def new
    @follow = Follow.new
    respond_with(@follow)
  end


  def create
    @follow = current_user.follows.build(:followed_id => params[:followed_id])
    if @follow.save
      flash[:notice] = "followed user."
      redirect_to root_url
    else
      flash[:notice] = "Unable to follow."
      redirect_to root_url
    end
  end

  def destroy
    @follow.destroy
    respond_with(@follow)
  end

  private
    def set_follow
      @follow = Follow.find(params[:id])
    end

    def follow_params
      params.require(:follow).permit(:user_id, :followed_id)
    end
end
