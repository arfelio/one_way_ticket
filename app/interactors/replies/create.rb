module Replies
  class Create
    include Interactor::Organizer
    organize Replies::Validate, Replies::Save, Replies::SendMail
  end
end
