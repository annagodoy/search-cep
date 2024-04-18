class UserSearch < ApplicationRecord
  belongs_to :user

  validates :user_id, :address, :street, :neighborhood, :zip_code, :city, :state, presence: true
end
