module BicycleLock
  module Support
    def array_to_integer(arr)
      raise(TypeError, 'arg must be an array') unless arr.is_a?(Array)
      raise(TypeError, 'arg index value must be int') unless arr.select { |val| val.is_a?(Integer) }.size == arr.size
      raise(ArgumentError, 'arg index value must be 0..9') unless arr.select { |val| (0..9).include?(val) }.size == arr.size
      arr.join.to_i
    end
  end
end
