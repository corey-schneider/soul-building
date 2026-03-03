Recaptcha.configure do |config|
  config.site_key = Rails.application.credentials.RECAPTCHA_SITE_KEY
  config.secret_key = Rails.application.credentials.RECAPTCHA_SECRET_KEY
  config.skip_verify_env << 'development' if Rails.env.development?
end
