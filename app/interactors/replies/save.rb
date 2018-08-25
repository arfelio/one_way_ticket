module Replies
  class Save
    include Interactor

    def call(repo: ReplyRepo)
      reply = repo.new(context.reply_params).create
      context.reply = reply
    end
  end
end
