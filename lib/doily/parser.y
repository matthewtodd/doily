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
    : literal
    | function_call
    ;

  literal
    : STRING_LITERAL
    | INTEGER_LITERAL
    ;

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

  def parse(string)
    @tokens = []
    scanner = StringScanner.new(string)

    until scanner.empty?
      case
			when scanner.scan(/\s+/)
				# ignore space
      when m = scanner.scan(/function/)
        @tokens.push [:FUNCTION, m]
      when m = scanner.scan(/[(){},]/)
        @tokens.push [m, m]
      when m = scanner.scan(/[a-zA-Z]+/)
        @tokens.push [:IDENTIFIER, m]
      when m = scanner.scan(/"([^"])*"/)
        @tokens.push [:STRING_LITERAL, eval(m)] # CLEVER: eval turns '"foo"' into "foo"
      when m = scanner.scan(/\d+/)
        @tokens.push [:INTEGER_LITERAL, m.to_i]
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

---- footer ----
