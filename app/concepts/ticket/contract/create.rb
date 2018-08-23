require "reform"
require "reform/form/dry"

module Ticket::Contract
  class Create < Reform::Form
    include Dry

    property :customer_name
    property :customer_email

    validation do
      required(:customer_name).filled
      required(:customer_email).filled
    end
  end
end
