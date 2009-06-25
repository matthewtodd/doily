module Doily
  class Object
    def initialize(properties)
      @properties = properties
    end

    def to_ruby(binding)
      result = {}
      @properties.each do |key, value|
        result[key.to_ruby(binding)] = value.to_ruby(binding)
      end
      result
    end
  end
end