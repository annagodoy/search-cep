class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string    :name
      t.string    :email
      t.string    :password_digest
      t.string    :api_token
      t.datetime  :expire_api_token_at
      
      t.timestamps
    end
  end
end
