class ValidateTicket
  include Interactor

  def call(validator: TicketValidator::Schema)
    res = validator.call(context.ticket_params)
    if res.failure?
      context.ticket = Ticket.new(context.ticket_params)
      context.fail!(message: res.messages)
    end
  end

end
