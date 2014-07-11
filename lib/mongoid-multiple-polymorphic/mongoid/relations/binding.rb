module Mongoid
  module Relations
    class Binding
      # Bind the inverse of field, when in a polymorphic relation.
      #
      # @api private
      #
      # @example Bind the inverse of field.
      #   binding.bind_inverse_of_field(doc)
      #
      # @param [ Document ] doc The document to bind.
      # @param [ String ] name The name of the relation.
      #
      # @since 3.0.0
      def bind_inverse_of_field(doc, name)
        if inverse_metadata = metadata.inverse_metadata(doc)
          if setter = inverse_metadata.inverse_of_field_setter
            doc.you_must(setter, name)
          end
        end
      end

      def bind_from_relational_parent(doc)
        check_inverse!(doc)
        bind_foreign_key(doc, record_id(base))
        bind_polymorphic_type(doc, base.class.name)
        bind_inverse(doc, base)
        bind_inverse_of_field(doc, metadata.name)
      end

      def unbind_from_relational_parent(doc)
        check_inverse!(doc)
        bind_foreign_key(doc, nil)
        bind_polymorphic_type(doc, nil)
        bind_inverse(doc, nil)
        bind_inverse_of_field(doc, nil)
      end
    end
  end
end
