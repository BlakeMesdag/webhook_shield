Rails.application.config.middleware.use OmniAuth::Builder do
  provider :heroku_sso, "HEROKU_SALT"
end