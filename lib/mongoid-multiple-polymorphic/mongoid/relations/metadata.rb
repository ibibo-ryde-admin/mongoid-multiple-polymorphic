module Mongoid
  module Relations
    class Metadata < Hash
      # Returns the name of the field in which to store the name of the inverse
      # field for the polymorphic relation.
      #
      # @example Get the name of the field.
      #   metadata.inverse_of_field
      #
      # @return [ String ] The name of the field for storing the name of the
      #   inverse field.
      #
      # @since 2.4.5
      def inverse_of_field
        @inverse_of_field ||= determine_inverse_for(:field)
      end

      # Gets the setter for the field that stores the name of the inverse field
      # on a polymorphic relation.
      #
      # @example Get the inverse type setter.
      #   metadata.inverse_of_field_setter
      #
      # @return [ String ] The name of the setter.
      def inverse_of_field_setter
        @inverse_of_field_setter ||= inverse_of_field.__setter__
      end
    end
  end
end
