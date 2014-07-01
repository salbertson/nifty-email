class RemoveBodyFromColumnNames < ActiveRecord::Migration
  def change
    rename_column :emails, :html_body, :html
    rename_column :emails, :text_body, :text
    rename_column :emails, :rendered_html_body, :rendered_html
    rename_column :emails, :rendered_text_body, :rendered_text
  end
end
