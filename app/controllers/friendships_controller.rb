class FriendshipsController < ApplicationController
  before_action :set_Friendships, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end
  end
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end
  def destroy
    @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to root_url
  end
  def article_params
    params.require(:article).permit( :body, :picture)
  end
  def set_Friendships
    @friendship = Friendship.find(params[:id])
  end
end
