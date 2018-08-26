class Repo

  def initialize(klass, params)
    @params = params
    @klass = klass
  end

  attr_reader :params, :klass

  def create
    klass.to_adapter.create!(params)
  end

  def find
    klass.to_adapter.find_first(params)
  end

  def find_by_id
    klass.to_adapter.get!(params)
  end

  def get_collection(args)
    args.each_pair { | key, value | args.delete(key) if value.blank? }
    klass.to_adapter.find_all(args)
  end

  def search
    if params[:search].present?
      get_collection(params[:search])
    else
      get_collection({})
    end
  end
end
