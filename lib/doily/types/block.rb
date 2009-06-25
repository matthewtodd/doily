module Doily
  class Block
    def initialize(expressions)
      @expressions = expressions
    end

    def to_ruby(binding)
      # TODO will want a local binding here
      result = nil
      @expressions.each do |expression|
        result = expression.to_ruby(binding)
      end
      result
    end
  end
end