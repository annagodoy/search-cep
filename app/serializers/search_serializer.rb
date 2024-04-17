class SearchSerializer
  include FastJsonapi::ObjectSerializer

  attributes :user_id, :address, :street, :neighborhood, :zip_code, :city, :state
end