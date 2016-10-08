class FriendshipsController < ApplicationController
  def index
    @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
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
end
