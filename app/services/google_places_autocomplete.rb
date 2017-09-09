class GooglePlacesAutocomplete
  KEY = ENV["GOOGLE_PLACES_KEY"]

  def initialize(search, user_id)
    @search = search
    @user_id = user_id
  end

  attr_reader :search, :user_id

  def run
    latitude = user.latitude
    longitude = user.longitude
    if latitude && longitude
      ## TODO: refactor this long url
      url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=#{search}&radius=10000&location=#{latitude},#{longitude}&key=#{KEY}"
      HTTParty.get(url)
    end
  end

  private

  attr_reader :user

  def user
    @user ||= User.find(user_id)
  end
end
