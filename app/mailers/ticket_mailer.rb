class TicketMailer < ApplicationMailer

  def ticket_accepted_mail(ticket)
    @ticket = ticket
    mail(to: @ticket.customer_email, subject: 'Your ticket accepted')
  end

  def reply_mail(ticket, reply)
    @ticket, @reply = ticket, reply
    mail(to: @ticket.customer_email, subject: 'Answer on your ticket')
  end

end
