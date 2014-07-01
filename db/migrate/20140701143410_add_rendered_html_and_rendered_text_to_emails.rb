class AddRenderedHtmlAndRenderedTextToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :rendered_html_body, :text
    add_column :emails, :rendered_text_body, :text
  end
end
