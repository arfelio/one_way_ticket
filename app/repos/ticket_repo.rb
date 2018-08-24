class TicketRepo

  def initialize(params)
    @params = params
  end

  attr_reader :params

  def create
    Ticket.to_adapter.create!(params)
  end

  def find
    Ticket.to_adapter.find_first(params)
  end
end
