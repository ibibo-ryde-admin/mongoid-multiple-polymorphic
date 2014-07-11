module Mongoid
  module Relations
    module Referenced
      class One < Relations::One

        private

        class << self
          def criteria(metadata, object, type = nil)
            crit = metadata.klass.where(metadata.foreign_key => object)
            if metadata.polymorphic?
              crit = crit.where(metadata.type => type.name)
            end
            inverse_metadata = metadata.inverse_metadata(metadata.klass)
            if inverse_metadata.inverse_of_field
              crit = crit.any_in(inverse_metadata.inverse_of_field => [metadata.name, nil])
            end
            crit
          end
        end
      end
    end
  end
end
