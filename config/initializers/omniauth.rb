OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :salesforce, ENV["SALESFORCE_CLIENT_ID"], ENV["SALESFORCE_CLIENT_SECRET"]
end