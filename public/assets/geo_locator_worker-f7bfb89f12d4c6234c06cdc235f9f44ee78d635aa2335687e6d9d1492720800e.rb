class GeoLocatorWorker
  include Sidekiq::Worker
  include HTTParty

  def perform(user_id)
    user = User.find(user_id)

    api_response = HTTParty.post("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GOOGLE_API']}",{})
    response = api_response.parsed_response
    lat = response["location"]["lat"]
    lng = response["location"]["lng"]

    user.update_attributes(:latitude => lat, :longitude => lng)

  end
end

# call from controller with--
# GetGeoLocatonWorker.perform_async(current_user.id)
