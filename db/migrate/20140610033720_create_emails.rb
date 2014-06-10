class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.text :html_body
      t.string :text_body
    end

    add_index :emails, :slug, unique: true
  end
end
