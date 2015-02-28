class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :nick_name
      t.string :oauth_token
      t.string :refresh_token
      t.string :instance_url

      t.timestamps
    end
  end
end
