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

  def find_by_id
    Ticket.to_adapter.get!(params)
  end

  def get_collection
    Ticket.to_adapter.find_all(params)
  end
end
