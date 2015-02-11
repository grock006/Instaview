class Favorite
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :username, type: String
  field :profile_url, type: String
  field :main_url, type: String
  field :text, type: String
  field :icon, type: String
  field :latitude, type: Float
  field :longitude, type: Float
  belongs_to :user 

  def convert_location
  	lat = latitude.to_s
  	lng = longitude.to_s
  	result = lat + "," + lng
  	@a = Geokit::Geocoders::GoogleGeocoder.geocode result
  	return @a.full_address
  end
end
