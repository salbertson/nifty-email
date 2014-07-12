class AddUserIdToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :user_id, :integer, null: false
  end
end
