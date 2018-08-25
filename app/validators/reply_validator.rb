require 'dry-validation'

class ReplyValidator
  Schema = Dry::Validation.Schema do
    required(:message).filled
    required(:ticket_id).filled
  end
end
