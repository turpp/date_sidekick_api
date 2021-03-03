class ActivitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :yelpID, :name, :image_url, :url, :categories, :price, :location, :display_phone
end
