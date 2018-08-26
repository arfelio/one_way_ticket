require 'rails_helper'

describe CreateTicket do

  describe ".call" do
    subject(:context) do
      CreateTicket.call(ticket_params:{
        customer_name: "John Dou",
        customer_email: "john@example.com",
        department: "R&D",
        subject: "Kettler doesnt work",
        description: "Lorem Ipsum Fish"})
    end

    context "when given valid credentials" do

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "provides the ticket" do
        expect(context.ticket.customer_name).to eq("John Dou")
      end

      it "provides the ticket to database" do
        expect(Repo.new(Ticket, context.ticket.id).find_by_id.customer_email).to eq("john@example.com")
      end
    end

    context "when given invalid credentials" do

      subject(:context) do
        CreateTicket.call(ticket_params:{
          customer_name: "",
          customer_email: "",
          department: "R&D",
          subject: "Kettler doesnt work",
          description: "Lorem Ipsum Fish"})
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
