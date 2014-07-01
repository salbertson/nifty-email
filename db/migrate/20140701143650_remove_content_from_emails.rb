class RemoveContentFromEmails < ActiveRecord::Migration
  def up
    remove_column :emails, :content
  end

  def down
    add_column :emails, :content, :text
  end
end
