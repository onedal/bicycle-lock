module BicycleLock
  module Generator
    extend Support
    extend Validation

    def self.call(from:, to:, exclude:)
      validate_data!(from: from, to: to, exclude: exclude)

      history = [from]

      from = array_to_integer(from)
      to =   array_to_integer(to)
      exclude = exclude.map { |e| array_to_integer(e) }

      state = StateMachine.new(current: from)
      until state.current == to
        to > from ? state.increment! : state.decrement!
        history << state.output unless exclude.include?(state.current)
      end
      history
    end
  end
end
