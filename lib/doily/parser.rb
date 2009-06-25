#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "lib/doily/parser.y".
#

require 'racc/parser'


require 'strscan'

module Doily

  class Parser < Racc::Parser

module_eval <<'..end lib/doily/parser.y modeval..ide4d9a56d53', 'lib/doily/parser.y', 55

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
..end lib/doily/parser.y modeval..ide4d9a56d53

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 1, 13, :_reduce_none,
 7, 14, :_reduce_2,
 0, 15, :_reduce_3,
 1, 15, :_reduce_4,
 3, 15, :_reduce_5,
 0, 16, :_reduce_6,
 1, 16, :_reduce_7,
 1, 17, :_reduce_none,
 1, 17, :_reduce_none,
 1, 17, :_reduce_none,
 1, 18, :_reduce_11,
 1, 18, :_reduce_12,
 1, 19, :_reduce_13,
 3, 19, :_reduce_14,
 4, 20, :_reduce_15,
 0, 21, :_reduce_16,
 1, 21, :_reduce_17,
 3, 21, :_reduce_18 ]

racc_reduce_n = 19

racc_shift_n = 30

racc_action_table = [
    23,    13,    14,    15,    12,    22,    13,    14,    15,    13,
    14,    15,     9,    10,     6,     8,     6,    21,     5,    24,
     4,    27,    28,     1 ]

racc_action_check = [
    19,    27,    27,    27,    10,    19,    23,    23,    23,    12,
    12,    12,     6,     7,     9,     5,     4,    16,     2,    22,
     1,    25,    26,     0 ]

racc_action_pointer = [
    21,    14,    18,   nil,    13,    15,     2,     6,   nil,    11,
    -4,   nil,     6,   nil,   nil,   nil,     8,   nil,   nil,    -6,
   nil,   nil,    16,     3,   nil,    11,    15,    -2,   nil,   nil ]

racc_action_default = [
   -19,   -19,   -19,    -1,    -3,   -19,    -4,   -19,    30,    -3,
   -19,    -5,    -6,   -13,   -11,   -12,   -19,    -7,    -8,    -9,
   -10,    -2,   -19,   -16,   -14,   -17,   -19,    -6,   -15,   -18 ]

racc_goto_table = [
    16,     7,     2,     3,    25,    26,    11,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    29 ]

racc_goto_check = [
     4,     3,     1,     2,     5,     9,     3,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     4 ]

racc_goto_pointer = [
   nil,     2,     3,    -3,   -12,   -19,   nil,   nil,   nil,   -18 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,    17,    18,    19,    20,   nil ]

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
 "," => 10,
 "." => 11 }

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
'","',
'"."',
'$start',
'target',
'function_definition',
'argument_name_list',
'expression_list',
'expression',
'literal',
'reference',
'function_call',
'argument_list']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

 # reduce 1 omitted

module_eval <<'.,.,', 'lib/doily/parser.y', 10
  def _reduce_2( val, _values, result )
 result = Function.new(val[2], val[5])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 14
  def _reduce_3( val, _values, result )
 result = []
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 15
  def _reduce_4( val, _values, result )
 result = [val[0]]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 16
  def _reduce_5( val, _values, result )
 result = [val[0]] + val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 21
  def _reduce_6( val, _values, result )
 result = []
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 22
  def _reduce_7( val, _values, result )
 result = [val[0]]
   result
  end
.,.,

 # reduce 8 omitted

 # reduce 9 omitted

 # reduce 10 omitted

module_eval <<'.,.,', 'lib/doily/parser.y', 32
  def _reduce_11( val, _values, result )
 result = Literal.new(eval(val[0]))
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 33
  def _reduce_12( val, _values, result )
 result = Literal.new(val[0].to_i)
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 37
  def _reduce_13( val, _values, result )
 result = Reference.new(val[0])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 38
  def _reduce_14( val, _values, result )
 result = Access.new(val[0], val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 42
  def _reduce_15( val, _values, result )
 result = Call.new(val[0], val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 46
  def _reduce_16( val, _values, result )
 result = []
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 47
  def _reduce_17( val, _values, result )
 result = [val[0]]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 48
  def _reduce_18( val, _values, result )
 result = [val[0]] + val[2]
   result
  end
.,.,

 def _reduce_none( val, _values, result )
  result
 end

  end   # class Parser

end   # module Doily
