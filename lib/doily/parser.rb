#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "lib/doily/parser.y".
#

require 'racc/parser'


require 'strscan'

module Doily

  class Parser < Racc::Parser

module_eval <<'..end lib/doily/parser.y modeval..id0e6d217e66', 'lib/doily/parser.y', 52

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
..end lib/doily/parser.y modeval..id0e6d217e66

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 1, 13, :_reduce_none,
 6, 14, :_reduce_2,
 0, 15, :_reduce_3,
 1, 15, :_reduce_4,
 1, 16, :_reduce_none,
 1, 16, :_reduce_none,
 1, 16, :_reduce_none,
 1, 17, :_reduce_8,
 1, 17, :_reduce_9,
 1, 17, :_reduce_10,
 3, 18, :_reduce_11,
 4, 19, :_reduce_12,
 0, 20, :_reduce_13,
 1, 20, :_reduce_14,
 3, 20, :_reduce_15 ]

racc_reduce_n = 16

racc_shift_n = 26

racc_action_table = [
     9,    10,    12,     9,    10,    12,     9,    10,    12,    17,
     7,     8,     5,     6,    18,    19,     4,    22,    23,    24,
     1 ]

racc_action_check = [
    23,    23,    23,    17,    17,    17,     8,     8,     8,     9,
     5,     6,     2,     4,    11,    14,     1,    19,    20,    21,
     0 ]

racc_action_pointer = [
    18,    10,    12,   nil,     6,    10,     3,   nil,     3,     3,
   nil,     5,   nil,   nil,     5,   nil,   nil,     0,   nil,    14,
     7,    12,   nil,    -3,   nil,   nil ]

racc_action_default = [
   -16,   -16,   -16,    -1,   -16,   -16,   -16,    26,    -3,   -10,
    -8,   -16,    -9,    -4,    -5,    -6,    -7,   -13,    -2,   -16,
   -14,   -16,   -11,    -3,   -12,   -15 ]

racc_goto_table = [
    11,     2,     3,    20,    21,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    25 ]

racc_goto_check = [
     3,     1,     2,     4,     8,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     3 ]

racc_goto_pointer = [
   nil,     1,     2,    -8,   -14,   nil,   nil,   nil,   -13 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,    13,    14,    15,    16,   nil ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :FUNCTION => 2,
 :IDENTIFIER => 3,
 :STRING_LITERAL => 4,
 :INTEGER_LITERAL => 5,
 "(" => 6,
 ")" => 7,
 "{" => 8,
 "}" => 9,
 "." => 10,
 "," => 11 }

racc_use_result_var = true

racc_nt_base = 12

Racc_arg = [
 racc_action_table,
 racc_action_check,
 racc_action_default,
 racc_action_pointer,
 racc_goto_table,
 racc_goto_check,
 racc_goto_default,
 racc_goto_pointer,
 racc_nt_base,
 racc_reduce_table,
 racc_token_table,
 racc_shift_n,
 racc_reduce_n,
 racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'FUNCTION',
'IDENTIFIER',
'STRING_LITERAL',
'INTEGER_LITERAL',
'"("',
'")"',
'"{"',
'"}"',
'"."',
'","',
'$start',
'target',
'function_definition',
'expression_list',
'expression',
'atom',
'property_access',
'function_call',
'argument_list']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

 # reduce 1 omitted

module_eval <<'.,.,', 'lib/doily/parser.y', 10
  def _reduce_2( val, _values, result )
 result = Function.new(val[4])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 15
  def _reduce_3( val, _values, result )
 result = []
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 16
  def _reduce_4( val, _values, result )
 result = [val[0]]
   result
  end
.,.,

 # reduce 5 omitted

 # reduce 6 omitted

 # reduce 7 omitted

module_eval <<'.,.,', 'lib/doily/parser.y', 26
  def _reduce_8( val, _values, result )
 result = StringLiteral.new(val[0])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 27
  def _reduce_9( val, _values, result )
 result = IntegerLiteral.new(val[0])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 28
  def _reduce_10( val, _values, result )
 result = Variable.new(val[0])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 32
  def _reduce_11( val, _values, result )
 result = PropertyAccess.new(val[0], val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 39
  def _reduce_12( val, _values, result )
 result = FunctionCall.new(val[0], val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 43
  def _reduce_13( val, _values, result )
 result = []
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 44
  def _reduce_14( val, _values, result )
 result = [val[0]]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 45
  def _reduce_15( val, _values, result )
 result = [val[0]] + val[2]
   result
  end
.,.,

 def _reduce_none( val, _values, result )
  result
 end

  end   # class Parser

end   # module Doily
