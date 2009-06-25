module Doily
  class Literal
    def initialize(value)
      @value = value
    end

    def to_ruby(binding)
      @value
    end
  end
end