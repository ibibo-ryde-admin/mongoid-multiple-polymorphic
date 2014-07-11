module Mongoid
  module Relations
    module Bindings
      module Referenced
        class In < Binding
          def bind_one
            binding do
              check_inverses!(target)
              bind_foreign_key(base, record_id(target))
              bind_polymorphic_inverse_type(base, target.class.name)
              if inverse = metadata.inverse(target)
                if set_base_metadata
                  bind_inverse_of_field(base, base.metadata_name)
                  if base.referenced_many?
                    target.__send__(inverse).push(base)
                  else
                    target.set_relation(inverse, base)
                  end
                end
              end
            end
          end

          def unbind_one
            binding do
              inverse = metadata.inverse(target)
              if !inverse && metadata.inverse_of_field
                inverse = base.__send__(metadata.inverse_of_field)
              end
              bind_foreign_key(base, nil)
              bind_polymorphic_inverse_type(base, nil)
              bind_inverse_of_field(base, nil)
              if inverse
                set_base_metadata
                if base.referenced_many?
                  target.__send__(inverse).delete(base)
                else
                  target.set_relation(inverse, nil)
                end
              end
            end
          end
        end
      end
    end
  end
end
