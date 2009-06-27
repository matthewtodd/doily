module Doily
  class Loop
    def initialize(before_all, before_each, after_each, block)
      @before_all  = before_all
      @before_each = before_each
      @after_each  = after_each
      @block       = block
    end

    def to_ruby(binding)
      binding = LocalBinding.new(binding)
      @before_all.to_ruby(binding)
      loop do
        break unless @before_each.to_ruby(binding)
        @block.to_ruby(binding)
        @after_each.to_ruby(binding)
      end
    end
  end
end