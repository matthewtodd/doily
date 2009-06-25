module Doily
  class Function
    def initialize(argument_names, expressions)
      @argument_names = argument_names
      @expressions    = expressions
    end

    def bind(binding)
      @binding = binding
      self
    end

    def call(*arguments)
      local_binding = ArgumentBinding.new(@argument_names, arguments, @binding)

      result = nil
      @expressions.each do |expression|
        result = expression.to_ruby(local_binding)
      end
      result
    end
  end
end