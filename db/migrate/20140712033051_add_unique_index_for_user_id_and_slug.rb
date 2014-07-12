class AddUniqueIndexForUserIdAndSlug < ActiveRecord::Migration
  def up
    remove_index :emails, :slug
    add_index :emails, [:slug, :user_id], unique: true
  end

  def down
    remove_index :emails, [:slug, :user_id]
    add_index :emails, :slug
  end
end
