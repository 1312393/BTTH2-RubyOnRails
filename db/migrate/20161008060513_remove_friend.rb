class RemoveFriend < ActiveRecord::Migration
  def change
    remove_column :users, :friend
    remove_column :users, :Friendship
  end
end
