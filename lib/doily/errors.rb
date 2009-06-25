module Doily
  class ArgumentError < RuntimeError
    def initialize(names, values)
      super("wrong number of arguments: expected #{names.inspect} but got #{values.inspect}")
    end
  end

  class ParseError < RuntimeError
    def initialize(scanner)
      super("Unknown token starting at position #{scanner.pos}: #{scanner.rest}")
    end
  end
end