class ReplyRepo

  def initialize(params)
    @params = params
  end

  attr_reader :params

  def create
    Reply.to_adapter.create!(params)
  end

  def find_by_id
    Reply.to_adapter.get!(params)
  end

  def get_collection
    Reply.to_adapter.find_all(params)
  end
end
