class Admin::TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = TicketRepo.new(params).search
  end

  def show
    @ticket = TicketRepo.new(params[:id]).find_by_id
    @replies = ReplyRepo.new({ticket_id: @ticket.id}).get_collection
  end

end
