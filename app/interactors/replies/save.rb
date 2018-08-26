module Replies
  class Save
    include Interactor

    def call(repo: Repo)
      reply = repo.new(Reply, context.reply_params).create
      context.reply = reply
    end
  end
end
