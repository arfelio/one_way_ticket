class TicketsController < ApplicationController

  def new
    # run Ticket::Create::Present
    # render cell(Ticket::Cell::New, @form), layout: false
  end

  def create
  end
end
