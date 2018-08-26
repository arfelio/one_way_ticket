class Admin::RepliesController < ApplicationController
  before_action :authenticate_user!

  def create
    res = Replies::Create.call(reply_params: reply_params)
    if res.success?
      render json: { notice: "Event created!" }
    else
      render json: res.message, status: :unprocessable_entity
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:message, :ticket_id)
  end
end
