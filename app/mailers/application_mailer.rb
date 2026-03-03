class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.default_sender_email
  layout 'mailer'
end
