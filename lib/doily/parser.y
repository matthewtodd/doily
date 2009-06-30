class Doily::Parser

  token FUNCTION IF ELSE FOR VAR BOOLEAN_LITERAL IDENTIFIER STRING_LITERAL INTEGER_LITERAL BINARY_OPERATOR

rule
  target
    : function_definition
    | '{' key_value_list '}' { result = Object.new(val[1]).to_ruby(nil) }
    ;

  function_definition
    : FUNCTION '(' argument_name_list ')' block { result = Function.new(val[2], val[4]) }
    ;

  argument_name_list
    :                                   { result = [] }
    | IDENTIFIER                        { result = [val[0]] }
    | IDENTIFIER ',' argument_name_list { result = [val[0]] + val[2] }
    ;

  block
    : '{' '}'                { result = Block.new([]) }
    | '{' statement_list '}' { result = Block.new(val[1]) }
    ;

  statement_list
    : statement                { result = [val[0]] }
    | statement statement_list { result = [val[0]] + val[1] }
    ;

  statement
    : if_statement
    | for_loop
    | expression ';'
    ;

  if_statement
    : IF '(' expression ')' block            { result = Conditional.new(val[2], val[4]) }
    | IF '(' expression ')' block ELSE block { result = Conditional.new(val[2], val[4], val[6]) }
    ;

  for_loop
    : FOR '(' expression ';' expression ';' expression ')' block { result = Loop.new(val[2], val[4], val[6], val[8]) }
    ;

  expression
    : reference
    | declaration
    | assignment
    | binary_expression
    | increment
    ;

  reference
    : variable
    | INTEGER_LITERAL                  { result = Literal.new(val[0].to_i) }
    | BOOLEAN_LITERAL                  { result = Literal.new(eval(val[0])) }
    | string_literal
    | '{' key_value_list '}'           { result = Object.new(val[1]) }
    | '[' reference_list ']'           { result = Array.new(val[1]) }
    | reference '.' IDENTIFIER         { result = Access.new(val[0], Literal.new(val[2])) }
    | reference '[' reference ']'      { result = Access.new(val[0], val[2]) }
    | reference '(' argument_list ')'  { result = Call.new(val[0], val[2]) }
    ;

  variable
    : IDENTIFIER { result = Reference.new(val[0]) }
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

  reference_list
    :                              { result = []}
    | reference                    { result = [val[0]]}
    | reference ',' reference_list { result = [val[0]] + val[2]}
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
    : reference BINARY_OPERATOR reference { result = Call.new(Access.new(val[0], Literal.new(val[1])), [val[2]]) }
    ;

  increment
    : variable '++' { result = Assignment.new(val[0], Call.new(Access.new(val[0], Literal.new('+')), [Literal.new(1)])) }
    ;

---- header ----
require 'strscan'
---- inner ----

  def self.parse(string)
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
      when m = scanner.scan(/for/)
        @tokens.push [:FOR, m]
      when m = scanner.scan(/var/)
        @tokens.push [:VAR, m]
      when m = scanner.scan(/true|false/)
        @tokens.push [:BOOLEAN_LITERAL, m]
      when m = scanner.scan(/==|</)
        @tokens.push [:BINARY_OPERATOR, m]
      when m = scanner.scan(/\+\+/)
        @tokens.push [m, m]
      when m = scanner.scan(/[(){}\[\],\.:;=]/)
        @tokens.push [m, m]
      when m = scanner.scan(/[a-zA-Z_]+/)
        @tokens.push [:IDENTIFIER, m]
      when m = scanner.scan(/"(?:\\.|[^"])*"/)
        @tokens.push [:STRING_LITERAL, m]
      when m = scanner.scan(/'(?:\\.|[^'])*'/)
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