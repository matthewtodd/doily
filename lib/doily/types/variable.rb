module Doily
  class Variable
    def initialize(name)
      @name = name
    end

    def evaluate(binding)
      binding.send(@name)
    end
  end
end
