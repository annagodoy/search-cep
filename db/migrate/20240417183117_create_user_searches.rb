class CreateUserSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :user_searches do |t|
      t.belongs_to :user, null: false, foreign_key: true
      
      t.string :address
      t.string :street
      t.string :neighborhood
      t.string :zip_code
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
