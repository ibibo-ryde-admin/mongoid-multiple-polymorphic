module Mongoid
  module Relations
    module Polymorphic
      module ClassMethods
        def polymorph(metadata)
          if metadata.polymorphic?
            self.polymorphic = true
            if metadata.relation.stores_foreign_key?
              field(metadata.inverse_type, type: String)
              field(metadata.inverse_of_field, type: Symbol)
            end
          end
          self
        end
      end
    end
  end
end
