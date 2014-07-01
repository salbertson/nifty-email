class ChangeTitleToNameForEmails < ActiveRecord::Migration
  def up
    remove_column :emails, :title
    add_column :emails, :name, :string, null: false
  end

  def down
    remove_column :emails, :name
    add_column :emails, :title, :string
  end
end
