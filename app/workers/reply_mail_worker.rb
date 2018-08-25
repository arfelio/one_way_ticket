class ReplyMailWorker
  include Sidekiq::Worker

  def perform(reply_id)
    reply = ReplyRepo.new(reply_id).find_by_id
    ticket = TicketRepo.new(reply.ticket_id).find_by_id
    TicketMailer.reply_mail(ticket, reply).deliver
  end
end
