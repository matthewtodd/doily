module Doily
  class ParseError < RuntimeError
    def initialize(scanner)
      super("Unknown token starting at position #{scanner.pos}: #{scanner.rest}")
    end
  end
end