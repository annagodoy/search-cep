class Search < ApplicationRecord
  belongs_to :user

  validates :address, :street, :neighborhood, :zip_code, :city, :state, presence: true
end
