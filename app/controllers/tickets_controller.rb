class TicketsController < ApplicationController

  def new
    @errors = {}
    @form = Ticket.new
  end

  def create
    res = CreateTicket.call(ticket_params: ticket_params)
    if res.success?
      redirect_to accepted_tickets_path
    else
      @form = res.ticket
      @errors = res.message
      render :new
    end
  end

  def accepted
  end

  private

  def ticket_params
    params.require(:ticket).permit(:customer_name,
      :customer_email, :department, :subject, :description)
  end
end
