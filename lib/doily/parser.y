class Doily::Parser

  token FUNCTION IDENTIFIER

rule
  target
    : function_definition
    ;

  function_definition
    : FUNCTION '(' ')' '{' statement_list '}' { result = Function.new(val[4]) }
    ;

  statement_list
    :           { result = [] }
    | statement { result = [val[0]] }
    ;

  statement
    : call_statement
    ;

  call_statement
    : IDENTIFIER '(' ')' { result = Call.new(val[0]) }
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
