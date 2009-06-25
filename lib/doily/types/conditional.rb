module Doily
  class Conditional
    def initialize(conditional, true_expressions, false_expressions=[])
      @conditional = conditional
      @true_block  = Block.new(true_expressions)
      @false_block = Block.new(false_expressions)
    end

    def to_ruby(binding)
      if @conditional.to_ruby(binding)
        @true_block.to_ruby(binding)
      else
        @false_block.to_ruby(binding)
      end
    end
  end
end