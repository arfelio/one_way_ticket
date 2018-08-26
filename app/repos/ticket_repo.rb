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

  def get_collection(args)
    args.each_pair { | key, value | args.delete(key) if value.blank? }
    Ticket.to_adapter.find_all(args)
  end

  def search
    if params[:search].present?
      get_collection(params[:search])
    else
      get_collection({})
    end
  end
end
