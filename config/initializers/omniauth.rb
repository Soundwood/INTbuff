Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"],ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true
    provider :github, ENV["GITHUB_KEY"],ENV["GITHUB_SECRET"]
    provider :facebook, ENV["FACEBOOK_APP_ID"],ENV["FACEBOOK_APP_SECRET"]
end