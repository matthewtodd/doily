module Doily
  class FunctionCall
    def initialize(name, args)
      @name = name
      @args = args
    end

    def evaluate(binding)
      binding.send(@name, *@args)
    end
  end
end
