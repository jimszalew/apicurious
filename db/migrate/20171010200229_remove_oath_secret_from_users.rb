class RemoveOathSecretFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :oauth_token_secret
  end
end
