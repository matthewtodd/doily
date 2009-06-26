class Doily::Parser

  token FUNCTION IF ELSE VAR BOOLEAN_LITERAL IDENTIFIER STRING_LITERAL INTEGER_LITERAL BINARY_OPERATOR

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

  expression_list
    :                                { result = [] }
    | expression                     { result = [val[0]] }
    | expression ';' expression_list { result = [val[0]] + val[2] }
    ;

  expression
    : reference
    | declaration
    | assignment
    | binary_expression
    | if_expression
    ;

  reference
    : IDENTIFIER                       { result = Reference.new(val[0]) }
    | INTEGER_LITERAL                  { result = Literal.new(val[0].to_i) }
    | BOOLEAN_LITERAL                  { result = Literal.new(eval(val[0])) }
    | string_literal
    | '{' key_value_list '}'           { result = Object.new(val[1]) }
    | reference '.' IDENTIFIER         { result = Access.new(val[0], val[2]) }
    | reference '[' STRING_LITERAL ']' { result = Access.new(val[0], eval(val[2])) }
    | reference '(' argument_list ')'  { result = Call.new(val[0], val[2]) }
    ;

  string_literal
    : STRING_LITERAL { result = Literal.new(eval(val[0])) }
    ;

  key_value_list
    :                              { result = {} }
    | key_value                    { result = val[0] }
    | key_value ',' key_value_list { result = val[0].merge(val[2]) }
    ;

  key_value
    : string_literal ':' reference { result = { val[0] => val[2] }}
    ;

  argument_list
    :                              { result = [] }
    | expression                   { result = [val[0]] }
    | expression ',' argument_list { result = [val[0]] + val[2] }
    ;

  assignment
    : expression '=' reference { result = Assignment.new(val[0], val[2]) }
    ;

  declaration
    : VAR IDENTIFIER { result = Declaration.new(val[1]) }
    ;

  binary_expression
    : reference BINARY_OPERATOR reference { result = Call.new(Access.new(val[0], val[1]), [val[2]]) }
    ;

  if_expression
    : IF '(' expression ')' '{' expression_list '}'                              { result = Conditional.new(val[2], val[5]) }
    | IF '(' expression ')' '{' expression_list '}' ELSE '{' expression_list '}' { result = Conditional.new(val[2], val[5], val[9]) }
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
      when m = scanner.scan(/if/)
        @tokens.push [:IF, m]
      when m = scanner.scan(/else/)
        @tokens.push [:ELSE, m]
      when m = scanner.scan(/var/)
        @tokens.push [:VAR, m]
      when m = scanner.scan(/true|false/)
        @tokens.push [:BOOLEAN_LITERAL, m]
      when m = scanner.scan(/==|</)
        @tokens.push [:BINARY_OPERATOR, m]
      when m = scanner.scan(/[(){}\[\],\.:;=]/)
        @tokens.push [m, m]
      when m = scanner.scan(/[a-zA-Z_]+/)
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