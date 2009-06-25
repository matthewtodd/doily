class Doily::Parser

  token FUNCTION IDENTIFIER

rule
  target
    : function_definition
    ;

  function_definition
    : FUNCTION '(' ')' '{' expression_list '}' { result = Function.new(val[4]) }
    ;

  expression_list
    :            { result = [] }
    | expression { result = [val[0]] }
    ;

  expression
    : function_call
    ;

  function_call
    : IDENTIFIER '(' ')' { result = FunctionCall.new(val[0]) }
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
      when m = scanner.scan(/\(/)
        @tokens.push ['(', m]
      when m = scanner.scan(/\)/)
        @tokens.push [')', m]
      when m = scanner.scan(/\{/)
        @tokens.push ['{', m]
      when m = scanner.scan(/\}/)
        @tokens.push ['}', m]
      when m = scanner.scan(/[a-zA-Z]+/)
        @tokens.push [:IDENTIFIER, m]
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
