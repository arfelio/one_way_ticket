class Ticket::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Ticket, :new)
    step Contract::Build( constant: Ticket::Contract::Create )
  end

  # ...
end
