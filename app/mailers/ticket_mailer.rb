class TicketMailer < ApplicationMailer
  def ticket_accepted_mail(ticket)
    @ticket = ticket
    mail(to: @ticket.customer_email, subject: 'Your ticket accepted')
  end
end
