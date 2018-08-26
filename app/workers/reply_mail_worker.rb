class ReplyMailWorker
  include Sidekiq::Worker

  def perform(reply_id)
    reply = Repo.new(Reply, reply_id).find_by_id
    ticket = Repo.new(Ticket, reply.ticket_id).find_by_id
    TicketMailer.reply_mail(ticket, reply).deliver
  end
end
