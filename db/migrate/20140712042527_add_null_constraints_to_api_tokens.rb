class AddNullConstraintsToApiTokens < ActiveRecord::Migration
  def change
    change_column_null :api_tokens, :token, false
    change_column_null :api_tokens, :user_id, false
  end
end
