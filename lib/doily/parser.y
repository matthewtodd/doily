class Doily::Parser

  token FUNCTION IDENTIFIER STRING_LITERAL INTEGER_LITERAL

rule
  target
    : function_definition
    ;

  function_definition
    : FUNCTION '(' ')' '{' expression_list '}' { result = Function.new(val[4]) }
    ;

  # TODO handle multiple expressions, separated by semicolon
  expression_list
    :            { result = [] }
    | expression { result = [val[0]] }
    ;

  expression
    : atom
    | property_access
    | function_call
    ;

  atom
    : STRING_LITERAL  { result = StringLiteral.new(val[0]) }
    | INTEGER_LITERAL { result = IntegerLiteral.new(val[0]) }
    | IDENTIFIER      { result = Variable.new(val[0]) }
    ;

  property_access
    : atom '.' IDENTIFIER { result = PropertyAccess.new(val[0], val[2]) }
    ;

  # I think function calls need another level of indirection:
  # first, look up the method in the binding, then call it with the parens
  # so: binding.get(name).call(args) instead of binding.send(name, *args)
  function_call
    : IDENTIFIER '(' argument_list ')' { result = FunctionCall.new(val[0], val[2]) }
    ;

  argument_list
    :                                { result = [] }
    | expression                     { result = [val[0]] }
    | expression ',' expression_list { result = [val[0]] + val[2] }
    ;

---- header ----
require 'strscan'
---- inner ----

  def self.function(string)
    new.parse(string)
  end

  def parse(string)
    @tokens = []
    scanner = StringScanner.new(string)

    until scanner.empty?
      case
			when scanner.scan(/\s+/)
				# ignore space
      when m = scanner.scan(/function/)
        @tokens.push [:FUNCTION, m]
      when m = scanner.scan(/[(){},\.]/)
        @tokens.push [m, m]
      when m = scanner.scan(/[a-zA-Z]+/)
        @tokens.push [:IDENTIFIER, m]
      when m = scanner.scan(/"([^"])*"/)
        @tokens.push [:STRING_LITERAL, m]
      when m = scanner.scan(/\d+/)
        @tokens.push [:INTEGER_LITERAL, m]
      else
        raise ParseError.new(scanner)
      end
    end

    @tokens.push [false, false]
    do_parse
  end

  def next_token
    @tokens.shift
  end