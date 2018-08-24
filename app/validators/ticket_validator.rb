require 'dry-validation'

class TicketValidator
  Schema = Dry::Validation.Schema do
    required(:customer_name).filled

  end
end
