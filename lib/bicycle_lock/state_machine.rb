module BicycleLock
  class StateMachine
    attr_accessor :current

    def initialize(current:)
      raise ArgumentError, 'current must be an Array' unless current.is_a?(Array)
      self.current = current
    end

    def increment_index!(index)
      self.current[index] = current[index] == 9 ? 0 : current[index] + 1
    end

    def decrement_index!(index)
      self.current[index] = current[index].zero? ? 9 : current[index] - 1
    end
  end
end
