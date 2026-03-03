class TicketsMailer < ApplicationMailer
  def ticket_notification(ticket)
    @ticket = ticket
    mail(
      to: Rails.application.credentials.receiver_emails,
      subject: "New Ticket ##{ticket.id} from #{ticket.first_name} #{ticket.last_name}"
    )
  end
end
