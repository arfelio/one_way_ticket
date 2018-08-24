class CreateTicket
  include Interactor::Organizer
  organize ValidateTicket, AssignUuid, SaveTicket
end
