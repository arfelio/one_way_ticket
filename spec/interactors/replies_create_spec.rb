require 'rails_helper'

describe Replies::Create do

  describe ".call" do
    subject(:context) do
      Replies::Create.call(reply_params:{
        ticket_id: 1,
        message: "Lorem Ipsum Fish"})
    end

    context "when given valid credentials" do

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "provides the reply" do
        expect(context.reply.ticket_id).to eq(1)
      end

      it "provides the ticket to database" do
        expect(Repo.new(Reply, context.reply.id).find_by_id.message).to eq("Lorem Ipsum Fish")
      end
    end

    context "when given invalid credentials" do

      subject(:context) do
        Replies::Create.call(reply_params:{
        ticket_id: nil,
        message: ""})
      end

      it "fails" do
        expect(context).to be_a_failure
      end

      it "provides a failure message" do
        expect(context.message).to be_present
      end
    end
  end
end
