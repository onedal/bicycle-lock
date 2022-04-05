module BicycleLock
  module Generator
    extend Validation

    def self.call(from:, to:, exclude:)
      validate_data!(from: from, to: to, exclude: exclude)

      iterations = [from.dup]
      state = StateMachine.new(current: from)

      while to != state.current
        combination_before_shift = state.current.dup

        (DISC_COUNT - 1).downto(0) do |i|
          case to <=> state.current
          when 0 then break
          when 1
            next if to[i] == state.current[i]
            state.increment_index!(i)

            if exclude.include?(state.current)
              state.decrement_index!(i)
              next
            end

          when -1
            next if to[i] == state.current[i]
            state.decrement_index!(i)

            if  exclude.include?(state.current)
              state.increment_index!(i)
              next
            end
          end
          iterations << state.current.dup
        end

        return { errors: true, iterations: iterations } if combination_before_shift == state.current
      end
      { errors: false, iterations: iterations }
    end
  end
end
