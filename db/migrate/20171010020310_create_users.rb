class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :username
      t.string :profile_picture
      t.string :oauth_token
      t.string :oauth_token_secret

      t.timestamps
    end
  end
end
