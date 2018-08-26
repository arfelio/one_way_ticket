class SaveTicket
  include Interactor

  def call(repo: Repo)
    ticket = repo.new(Ticket, context.ticket_params.merge(uuid: context.uuid)).create
    context.ticket = ticket
  end
end
