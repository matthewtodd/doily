module Doily
  class Function
    def initialize(expressions)
      @expressions = expressions
    end

    def bind(binding)
      @binding = binding
      self
    end

    def call
      result = nil
      @expressions.each do |expression|
        result = expression.evaluate(@binding)
      end
      result
    end
  end
end