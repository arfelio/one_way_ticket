class UuidValidator
  Schema = Dry::Validation.Schema do
    configure do

      def unique?(attr_name, value)
        options = {}
        options[attr_name.to_sym] = value
        TicketRepo.new(options).find.nil?
      end

    end

    required(:uuid).filled(unique?: :uuid)
  end
end
