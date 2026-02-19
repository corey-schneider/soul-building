class Ticket < ApplicationRecord
  enum status: %i[open closed]
  validates :first_name, :last_name, :email, :phone, :body, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\+?[0-9\s().-]{7,}\z/ }
  validates_length_of :body, minimum: 10, maximum: 800
end
