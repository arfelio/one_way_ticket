class UuidValidator
  Schema = Dry::Validation.Schema do
    configure do
      config.messages_file = Rails.root + 'validation_messages.yml'

      def unique?(attr_name, value)
        options = {}
        options[attr_name.to_sym] = value
        Repo.new(Ticket, options).find.nil?
      end

    end

    required(:uuid).filled(unique?: :uuid)
  end
end
