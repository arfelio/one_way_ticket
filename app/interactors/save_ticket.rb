class SaveTicket
  include Interactor

  def call(repo: TicketRepo)
    repo.new(context.ticket_params.merge(uuid: context.uuid)).create
  end
end
