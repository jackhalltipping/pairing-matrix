class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :text
    add_column :users, :github, :text
  end
end
