class AssignUuid
  include Interactor

  def call(uuid_creator: UuidCreator)
    context.uuid = uuid_creator.generate
  end

end
