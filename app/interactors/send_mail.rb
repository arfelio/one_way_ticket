class SendMail
  include Interactor

  def call
    MailWorker.perform_async(context.uuid)
  end
end
