module Replies
  class SendMail
    include Interactor

    def call
      ReplyMailWorker.perform_async(context.reply.id)
    end
  end
end
