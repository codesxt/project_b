class FriendshipsController < ApplicationController
  def create
  	@friendship = current_user.friendships.build(:friend_id => params[:friend_id], :status => 0)
  	if @friendship.save
  		flash[:notice] = "Added friend."
  		redirect_to :back
  	else
  		flash[:error] = "Unable to add friend."
  		redirect_to :back
  	end
  end

  def accept
  	@friendship = current_user.inverse_friendships.find(params[:id])
  	@friendship.status = 1
  	@friendship.save
  	redirect_to :back
  end

  def destroy
  	@friendship = Friendship.find(params[:id])
  	if @friendship.user_id == current_user.id or @friendship.friend_id == current_user.id
  		@friendship.destroy
  	end
  	flash[:notice] = "Removed friendship."
  	redirect_to :back
  end
end
