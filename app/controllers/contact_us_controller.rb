class ContactUsController < ApplicationController
  def index
    set_meta_tags title: 'Contact Us'
    @ticket = Ticket.new
  end

  def show_phone_number
    if verify_recaptcha(action: 'show_phone', minimum_score: 0.6)
      phone_number = Rails.application.credentials.contact_phone_number || '(unavailable)'
      render json: { phone_number: phone_number }
    else
      render json: { error: 'reCAPTCHA verification failed. Hiding phone number.' }, status: :unprocessable_entity
    end
  end
end
