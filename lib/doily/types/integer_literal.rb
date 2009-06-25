module Doily
  class IntegerLiteral
    def initialize(value)
      @value = value
    end

    def evaluate(binding)
      @value.to_i
    end
  end
end