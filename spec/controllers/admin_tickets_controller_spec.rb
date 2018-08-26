require 'rails_helper'

describe Admin::TicketsController do
  login_user
  let(:ticket_params) do
    {
      customer_name: "John Dou",
      customer_email: "john@example.com",
      department: "R&D",
      subject: "Kettler doesnt work",
      description: "Lorem Ipsum Fish"
    }
  end

  before { Repo.new(Ticket, ticket_params).create }

  it "should get index" do
    get :index
    expect(response.status).to eq(200)
  end

  it "should assign tickets variable" do
    visit admin_tickets_path
    fill_in 'user_email', with: "test@mail.com"
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content(ticket_params[:customer_name])
  end

end
