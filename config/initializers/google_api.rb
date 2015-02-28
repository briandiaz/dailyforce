require 'json'
require 'rest-client' 
require 'uri'

module Google
    module API
        def self.google_images_api_search(search_query)
            url = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+URI.escape(search_query)
            json_data = JSON.parse(RestClient.get(url))
            (json_data["responseStatus"].to_i == 200) ? json_data["responseData"]["results"] : nil
        end
    
        def self.search_google_image_by(search_query)
            images = self.google_images_api_search(search_query)
            (images) ? images[0]["url"] : "http://icons.iconarchive.com/icons/aha-soft/transport/256/car-icon.png"
        end
    end
end