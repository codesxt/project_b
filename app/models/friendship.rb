class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"
	def self.friendships_by_user(user_id)
		id = user_id
		@friendships = Friendship.select(:id, :user_id, :friend_id, :status).where(:user_id => id) | Friendship.select(:id, 'friend_id AS user_id', 'user_id AS friend_id', :status).where(:friend_id => id)
	end

	def self.friends_by_user(user_id)
		id = user_id
		@friendships = Friendship.select(:id, :user_id, :friend_id, :status).where(:user_id => id, :status => 1) | Friendship.select(:id, 'friend_id AS user_id', 'user_id AS friend_id', :status).where(:friend_id => id, :status => 1)
	end
end
