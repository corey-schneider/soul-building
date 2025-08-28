class Ticket < ApplicationRecord
  enum status: %i[open closed]
  validates_presence_of :first_name, :last_name, :email, :phone, :body
end
