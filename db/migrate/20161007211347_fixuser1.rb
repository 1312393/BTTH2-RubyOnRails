class Fixuser1 < ActiveRecord::Migration
  def change
    add_column :users, :friend, :string, array: true, default: '{}'
  end
end
