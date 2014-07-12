class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.string :token
    end
  end
end
