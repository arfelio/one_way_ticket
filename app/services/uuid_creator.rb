class UuidCreator
  class << self
    def generate
      new.generate
    end
  end

  def generate
    result = create_with_validation
    if result.success?
      result.output[:uuid]
    else
      generate
    end
  end

  private

  def create_with_validation
    UuidValidator::Schema.call(uuid: uuid)
  end

  def letters
    Array.new(3) { Array('A'..'Z').sample }.join
  end

  def numbers
    Array.new(3) { rand(1...9) }.join('')
  end

  def uuid
    uuid = ''
    2.times { uuid.concat(letters).concat("-#{numbers}-") }
    uuid.concat(letters)
  end

end
