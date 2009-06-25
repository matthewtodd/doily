module Doily
  class StringLiteral
    def initialize(value)
      @value = value
    end

    def evaluate(binding)
      eval(@value) # CLEVER: eval turns '"foo"' into "foo"
    end
  end
end