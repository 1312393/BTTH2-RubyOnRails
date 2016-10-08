class AddFriendshipToUser < ActiveRecord::Migration
  def change
    add_column :users,  :Friendship, :integer
  end
end
