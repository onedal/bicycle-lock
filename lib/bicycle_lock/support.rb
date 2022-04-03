module BicycleLock
  module Support
    def array_to_integer(arr)
      raise(TypeError, 'arg must be an array') unless arr.is_a?(Array)
      arr&.join&.to_i
    end
  end
end
