class Doily::Parser

  token FUNCTION IDENTIFIER STRING_LITERAL INTEGER_LITERAL OPERATOR

rule
  target
    : function_definition
    ;

  function_definition
    : FUNCTION '(' argument_name_list ')' '{' expression_list '}' { result = Function.new(val[2], val[5]) }
    ;

  argument_name_list
    :                                   { result = [] }
    | IDENTIFIER                        { result = [val[0]] }
    | IDENTIFIER ',' argument_name_list { result = [val[0]] + val[2] }
    ;

  # TODO handle multiple expressions, separated by semicolon
  expression_list
    :            { result = [] }
    | expression { result = [val[0]] }
    ;

  expression
    : reference
    | binary_expression
    ;

  reference
    : IDENTIFIER                      { result = Reference.new(val[0]) }
    | INTEGER_LITERAL                 { result = Literal.new(val[0].to_i) }
    | STRING_LITERAL                  { result = Literal.new(eval(val[0])) }
    | reference '.' IDENTIFIER        { result = Access.new(val[0], val[2]) }
    | reference '(' argument_list ')' { result = Call.new(val[0], val[2]) }
    ;

  argument_list
    :                              { result = [] }
    | expression                   { result = [val[0]] }
    | expression ',' argument_list { result = [val[0]] + val[2] }
    ;

  binary_expression
    : reference OPERATOR reference { result = Call.new(Access.new(val[0], val[1]), [val[2]]) }
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
      when m = scanner.scan(/==|</)
        @tokens.push [:OPERATOR, m]
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