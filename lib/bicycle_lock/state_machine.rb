module BicycleLock
  class StateMachine
    attr_accessor :current

    def initialize(current:)
      raise ArgumentError, 'current must be an integer' unless current.is_a?(Integer)
      self.current  = current
    end

    def increment! = self.current += 1
    def decrement! = self.current -= 1

    def output
      current_array = current.to_s.split('').map(&:to_i)
      (::DISC_COUNT - current_array.count).times { current_array.unshift(0) }
      current_array
    end
  end
end
