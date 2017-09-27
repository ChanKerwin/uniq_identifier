require_relative 'uniq_identifier/railtie' if defined?(Rails)
require_relative 'uniq_identifier/hook'
require_relative 'uniq_identifier/configure'

module UniqIdentifier
  extend Configure

  def uniq_identifier(auto: true, validate: true, generator: :default)
    @@uniq_identifier_generator = generator

    class << self
      def uniq_identifier_generator
        if @@uniq_identifier_generator == :default
          UniqIdentifier.configuration.generator
        else
          @@uniq_identifier_generator
        end
      end
    end

    if auto
      before_validation :set_uniq_identifier
      prepend Hook
    end

    if validate
      validates :uuid, presence: true, uniqueness: true
    end
  end
end
