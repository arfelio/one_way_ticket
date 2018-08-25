module Replies
  class Validate
    include Interactor

    def call(validator: ReplyValidator::Schema)
      res = validator.call(context.reply_params)
      if res.failure?
        context.fail!(message: res.messages)
      end
    end
  end
end
