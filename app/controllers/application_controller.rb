class ApplicationController < ActionController::Base
  before_filter :verify_authentication, :only => [:home, :new, :index, :update, :edit, :show, :destroy, :create]
  protect_from_forgery with: :exception

  def verify_authentication
      redirect_to login_path if !current_user and (original_url != '/login'  and original_url != '/auth/salesforce' and original_url != '/auth/salesforce/callback' and original_url != '/auth')
  end 
  
  private
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def current_client
      @current_client ||= Restforce.new :oauth_token => current_user.oauth_token,
              :refresh_token => current_user.refresh_token,
              :instance_url  => current_user.instance_url,
              :client_id     => ENV["SALESFORCE_CLIENT_ID"],
              :client_secret => ENV["SALESFORCE_CLIENT_SECRET"] if session[:user_id]
    end
    
    def original_url
      url_for(:only_path => true, :overwrite_params=>nil)
    end
    
    
  helper_method :current_user, :current_client
  
  
end
