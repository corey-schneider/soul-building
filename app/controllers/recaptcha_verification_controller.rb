class RecaptchaVerificationController < ApplicationController
  def verify
    # In development, skip the actual SSL-breaking call to Google and just approve
    if Rails.env.development?
      session[:human_verified] = true
      render json: { verified: true } and return
    end

    if verify_recaptcha(action: 'homepage', minimum_score: 0.5)
      session[:human_verified] = true
      render json: { verified: true }
    else
      session[:human_verified] = false
      render json: { verified: false }
    end
  end
end
