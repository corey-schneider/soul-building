class ContactUsController < ApplicationController
  def index
    set_meta_tags title: 'Contact Us'
    @ticket = Ticket.new
  end
end
