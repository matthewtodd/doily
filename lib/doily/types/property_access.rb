module Doily
  class PropertyAccess
    def initialize(variable, name)
      @variable = variable
      @name     = name
    end

    def evaluate(binding)
      @variable.evaluate(binding).send(@name)
    end
  end
end