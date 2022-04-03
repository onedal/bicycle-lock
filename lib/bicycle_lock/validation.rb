module BicycleLock
  module Validation
    def validate_data!(from:, to:, exclude:)
      array?(from: from, to: to,
                exclude: exclude) && solution_exist?(from: from, to: to,
exclude: exclude) && disc_count_valid?(to: to, from: from)
    end

    private

    def array?(from:, to:, exclude:)
      if from.is_a?(Array) && to.is_a?(Array) && exclude.is_a?(Array)
        true
      else
        raise(TypeError,
              'from or to or exclude must be an array')
      end
    end

    def solution_exist?(from:, to:, exclude:)
      from.size != to.size || exclude.include?(to) ? raise(ArgumentError, 'solution not found') : true
    end

    def disc_count_valid?(to:, from:)
      raise(ArgumentError, 'DISC_COUNT must be defined') unless Object.const_defined?('DISC_COUNT')

      DISC_COUNT&.is_a?(Integer) ? true : raise(ArgumentError, 'DISC_COUNT must be a integer')

      if DISC_COUNT == to.size && DISC_COUNT == from.size
        true
      else
        raise(ArgumentError,
              'DISC_COUNT must be equal from & to size')
      end
    end
  end
end
