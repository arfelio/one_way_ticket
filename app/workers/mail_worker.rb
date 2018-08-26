class MailWorker
  include Sidekiq::Worker

  def perform(ticket_uuid)
    ticket = Repo.new(Ticket, { uuid: ticket_uuid }).find
    TicketMailer.ticket_accepted_mail(ticket).deliver
  end
end
