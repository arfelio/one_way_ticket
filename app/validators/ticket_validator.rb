require 'dry-validation'

class TicketValidator
  Schema = Dry::Validation.Schema do
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    configure do
      config.messages_file = Rails.root + 'validation_messages.yml'

      def email?(value)
        !EMAIL_REGEX.match(value).nil?
      end

    end

    required(:customer_name).filled
    required(:customer_email).filled(:email?)
    required(:department).filled
    required(:subject).filled
    required(:description).filled

  end
end
