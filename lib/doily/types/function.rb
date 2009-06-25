module Doily
  class Function
    def initialize(parameters, expressions)
      @parameters = parameters
      @block      = Block.new(expressions)
    end

    def bind(binding)
      BoundFunction.new(@parameters, @block, binding)
    end

    def call(*args)
      bind(nil).call(*args)
    end

    class BoundFunction
      def initialize(parameters, block, binding)
        @parameters = parameters
        @block      = block
        @binding    = binding
      end

      def call(*args)
        @block.to_ruby(ArgumentBinding.new(@parameters, args, @binding))
      end
    end
  end
end