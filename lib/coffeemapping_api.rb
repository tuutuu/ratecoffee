class CoffeemappingApi
  def self.places_in(city)
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?key=#{key}&query="

    response = HTTParty.get "#{url}coffee #{ERB::Util.url_encode(city)}"
    places = response.parsed_response["results"]

    return [] if places.is_a?(Hash) and places['id'].nil?

    places = [places] if places.is_a?(Hash)
    places.map do | place |
      Place.new(place)
    end
  end

  def self.key
    "AIzaSyCUTjR__aWoZTiaW5D8Ixk2WrGQ8Lw0DJc"
  end
end
