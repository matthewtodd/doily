class Doily::Parser

  token FUNCTION

rule
  target
    : function
    ;
    
  function
    : FUNCTION '(' ')' '{' '}' { result = lambda {} }
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
      end
    end

    @tokens.push [false, false]
    do_parse
  end

  def next_token
    @tokens.shift
  end

---- footer ----
