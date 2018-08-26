require 'rails_helper'

describe Repo do

  describe "#search" do

    let(:ticket_params) do
      {
        customer_name: "John Dou",
        customer_email: "john@example.com",
        department: "R&D",
        subject: "Kettler doesnt work",
        description: "Lorem Ipsum Fish"
      }
    end

    before do
      Repo.new(Ticket, ticket_params).create
      Repo.new(Ticket, ticket_params).create
    end

    context "when given params to search" do

      it "return Ticket object with needed criteria" do
        res = Repo.new(Ticket, { search:{customer_name: "John Dou"} }).search
        expect(res.first.customer_name).to eq("John Dou")
      end

      it "doesnt return Ticket object when object with criteria is absent in DB" do
        res = Repo.new(Ticket, { search:{customer_name: "Ivan Dorn"} }).search
        expect(res.first).to eq(nil)
      end

      it "return all objects from db if criteeria is absent" do
        res = Repo.new(Ticket, {}).search
        expect(res.size).to eq(2)
      end

    end
  end

  describe "#create" do
    let(:ticket_params) do
      {
        customer_name: "John Dou",
        customer_email: "john@example.com",
        department: "R&D",
        subject: "Kettler doesnt work",
        description: "Lorem Ipsum Fish"
      }
    end

    context "when given params to search" do

      it "return freshly created Ticket object" do
        res = Repo.new(Ticket, ticket_params).create
        expect(res.customer_name).to eq("John Dou")
      end

    end
  end

  describe "#find_by_id" do
    let(:ticket_params) do
      {
        customer_name: "John Dou",
        customer_email: "john@example.com",
        department: "R&D",
        subject: "Kettler doesnt work",
        description: "Lorem Ipsum Fish"
      }
    end

    before do
      Repo.new(Ticket, ticket_params).create
      Repo.new(Ticket, ticket_params).create
    end

    context "when given id to find" do

      it "return freshly created Ticket object" do
        res = Repo.new(Ticket, ticket_params).create
        expect(res.customer_name).to eq("John Dou")
      end

    end
  end
end
