Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.FACEBOOK_KEY, Rails.application.secrets.FACEBOOK_SECRET
end