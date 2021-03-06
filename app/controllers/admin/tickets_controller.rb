class Admin::TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = Repo.new(Ticket, params).search
  end

  def show
    @ticket = Repo.new(Ticket, params[:id]).find_by_id
    @replies = Repo.new(Reply, {}).get_collection({ticket_id: @ticket.id})
  end

end
