module Doily
  class Conditional
    def initialize(conditional, expressions)
      @conditional = conditional
      @block       = Block.new(expressions)
    end

    def to_ruby(binding)
      if @conditional.to_ruby(binding)
        @block.to_ruby(binding)
      end
    end
  end
end