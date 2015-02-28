module ApplicationHelper
    
    def profile_picture
        current_client.user_info.photos.picture if current_client
    end
    
end