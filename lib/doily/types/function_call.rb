module Doily
  class FunctionCall
    def initialize(name, args)
      @name = name
      @args = args
    end

    def evaluate(binding)
      binding.send(@name, *@args.map { |arg| arg.evaluate(binding) })
    end
  end
end
