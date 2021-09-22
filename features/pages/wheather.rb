class Wheather
    include HTTParty

    base_uri "api.openweathermap.org"

    def initialize(auth_token)
        @auth_token = auth_token
    end

    # Public: Search for wheather info for a given city
    #
    # city    - city name
    # handler - (optional) function to handle the data returned by the API
    #
    # Returns wheater info
    def search_by_city(city, handler = nil)
        @options = { 
            query: 
            { 
                q: city, 
                appid: @auth_token 
            } 
        }
        resp = self.class.get("/data/2.5/weather", @options)
        if resp.code == 200
            if defined?(handler)
                return handler.call(resp.parsed_response)
            else
                return resp.parsed_response
            end
        else
            raise "Error while retrieving wheather info"
        end
    end

    # Public: Search for wheather info for the given voordinates (lat x lon)
    #
    # lat     - latitude
    # lon     - logitude
    # handler - (optional) function to handle the data returned by the API
    #
    # Returns wheater info
    def search_by_coords(lat, lon, handler = nil)
        @options = { 
            query: 
            { 
                lat: lat, 
                lon: lon,
                appid: @auth_token 
            } 
        }
        resp = self.class.get("/data/2.5/weather", @options)
        if resp.code == 200
            if defined?(handler)
                return handler.call(resp.parsed_response)
            else
                return resp.parsed_response
            end
        else
            raise "Error while retrieving wheather info"
        end
    end

end