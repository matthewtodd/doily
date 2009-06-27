module Doily
  class Conditional
    def initialize(conditional, true_block, false_block = Block.new)
      @conditional = conditional
      @true_block  = true_block
      @false_block = false_block
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