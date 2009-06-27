#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "lib/doily/parser.y".
#

require 'racc/parser'


require 'strscan'

module Doily

  class Parser < Racc::Parser

module_eval <<'..end lib/doily/parser.y modeval..ida5a6694797', 'lib/doily/parser.y', 102

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
      when m = scanner.scan(/\+\+/)
        @tokens.push [m, m]
      when m = scanner.scan(/[(){}\[\],\.:;=]/)
        @tokens.push [m, m]
      when m = scanner.scan(/[a-zA-Z_]+/)
        @tokens.push [:IDENTIFIER, m]
      when m = scanner.scan(/"([^"])*"/)
        @tokens.push [:STRING_LITERAL, m]
      when m = scanner.scan(/'([^'])*'/)
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
..end lib/doily/parser.y modeval..ida5a6694797

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 1, 24, :_reduce_none,
 5, 25, :_reduce_2,
 0, 26, :_reduce_3,
 1, 26, :_reduce_4,
 3, 26, :_reduce_5,
 2, 27, :_reduce_6,
 3, 27, :_reduce_7,
 1, 28, :_reduce_8,
 2, 28, :_reduce_9,
 1, 29, :_reduce_none,
 2, 29, :_reduce_none,
 1, 31, :_reduce_none,
 1, 31, :_reduce_none,
 1, 31, :_reduce_none,
 1, 31, :_reduce_none,
 1, 31, :_reduce_none,
 1, 32, :_reduce_none,
 1, 32, :_reduce_18,
 1, 32, :_reduce_19,
 1, 32, :_reduce_none,
 3, 32, :_reduce_21,
 3, 32, :_reduce_22,
 4, 32, :_reduce_23,
 4, 32, :_reduce_24,
 1, 37, :_reduce_25,
 1, 38, :_reduce_26,
 0, 39, :_reduce_27,
 1, 39, :_reduce_28,
 3, 39, :_reduce_29,
 3, 41, :_reduce_30,
 0, 40, :_reduce_31,
 1, 40, :_reduce_32,
 3, 40, :_reduce_33,
 3, 34, :_reduce_34,
 2, 33, :_reduce_35,
 3, 35, :_reduce_36,
 2, 36, :_reduce_37,
 5, 30, :_reduce_38,
 7, 30, :_reduce_39 ]

racc_reduce_n = 40

racc_shift_n = 68

racc_action_table = [
    17,    58,    22,    24,    26,    28,    30,    49,    38,    37,
    42,    18,    21,    17,    62,    22,    24,    26,    28,    30,
    28,    48,    42,    39,    18,    22,    24,    26,    28,    30,
    50,    33,     1,    55,    18,    22,    24,    26,    28,    30,
    56,     7,    11,    10,    18,    22,    24,    26,    28,    30,
    46,    43,    28,     9,    18,    61,     8,    44,    45,    24,
    26,    28,    30,    24,    26,    28,    30,    18,    63,     7,
    43,    18,    24,    26,    28,    30,    44,    45,    43,    11,
    18,    43,     5,     4,    44,    45,    41,    44,    45,    66,
    11,    42 ]

racc_action_check = [
    11,    47,    11,    11,    11,    11,    11,    35,    22,    20,
    47,    11,    11,    27,    54,    27,    27,    27,    27,    27,
    18,    34,    54,    25,    27,    62,    62,    62,    62,    62,
    36,    17,     0,    44,    62,    33,    33,    33,    33,    33,
    45,    10,     9,     7,    33,    43,    43,    43,    43,    43,
    32,    32,    50,     6,    43,    53,     5,    32,    32,    42,
    42,    42,    42,    48,    48,    48,    48,    42,    56,     4,
    52,    48,    46,    46,    46,    46,    52,    52,    57,    58,
    46,    59,     2,     1,    57,    57,    31,    59,    59,    64,
    66,    31 ]

racc_action_pointer = [
    30,    72,    82,   nil,    62,    56,    41,    30,   nil,    28,
    34,    -3,   nil,   nil,   nil,   nil,   nil,    20,    12,   nil,
   -13,   nil,     1,   nil,   nil,     8,   nil,    10,   nil,   nil,
   nil,    70,    40,    30,     1,    -8,    17,   nil,   nil,   nil,
   nil,   nil,    53,    40,    26,    32,    66,   -11,    57,   nil,
    44,   nil,    59,    43,     1,   nil,    49,    67,    65,    70,
   nil,   nil,    20,   nil,    85,   nil,    76,   nil ]

racc_action_default = [
   -40,   -40,   -40,    -1,    -3,   -40,   -40,    -4,    68,   -40,
    -3,   -40,    -2,    -5,   -13,   -14,   -15,   -40,   -27,   -16,
   -17,    -6,   -40,   -20,   -19,   -40,   -25,    -8,   -26,   -10,
   -18,   -40,   -12,   -40,   -40,   -40,   -28,   -37,   -35,    -7,
    -9,   -11,   -40,   -31,   -40,   -40,   -40,   -40,   -40,   -21,
   -27,   -17,   -34,   -40,   -32,   -22,   -40,   -36,   -40,   -30,
   -29,   -24,   -31,   -23,   -38,   -33,   -40,   -39 ]

racc_goto_table = [
    12,    35,    34,    47,    53,    25,    52,     3,     6,     2,
    57,    51,    59,    54,    13,    51,   nil,    51,   nil,   nil,
   nil,    40,   nil,    65,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    54,    60,    34,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    64,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    67 ]

racc_goto_check = [
     4,    16,    15,     8,    17,     5,     9,     2,     3,     1,
     9,    14,     9,     8,     3,    14,   nil,    14,   nil,   nil,
   nil,     5,   nil,    17,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     8,    16,    15,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4 ]

racc_goto_pointer = [
   nil,     9,     7,     4,    -9,    -6,   nil,   nil,   -30,   -36,
   nil,   nil,   nil,   nil,   -31,   -16,   -17,   -39,   nil ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,    27,    29,    31,    32,
    14,    15,    16,    19,    20,    23,   nil,   nil,    36 ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :FUNCTION => 2,
 :IF => 3,
 :ELSE => 4,
 :VAR => 5,
 :BOOLEAN_LITERAL => 6,
 :IDENTIFIER => 7,
 :STRING_LITERAL => 8,
 :INTEGER_LITERAL => 9,
 :BINARY_OPERATOR => 10,
 "(" => 11,
 ")" => 12,
 "," => 13,
 "{" => 14,
 "}" => 15,
 ";" => 16,
 "." => 17,
 "[" => 18,
 "]" => 19,
 ":" => 20,
 "=" => 21,
 "++" => 22 }

racc_use_result_var = true

racc_nt_base = 23

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
'IF',
'ELSE',
'VAR',
'BOOLEAN_LITERAL',
'IDENTIFIER',
'STRING_LITERAL',
'INTEGER_LITERAL',
'BINARY_OPERATOR',
'"("',
'")"',
'","',
'"{"',
'"}"',
'";"',
'"."',
'"["',
'"]"',
'":"',
'"="',
'"++"',
'$start',
'target',
'function_definition',
'argument_name_list',
'block',
'statement_list',
'statement',
'if_statement',
'expression',
'reference',
'declaration',
'assignment',
'binary_expression',
'increment',
'variable',
'string_literal',
'key_value_list',
'argument_list',
'key_value']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

 # reduce 1 omitted

module_eval <<'.,.,', 'lib/doily/parser.y', 10
  def _reduce_2( val, _values, result )
 result = Function.new(val[2], val[4])
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

module_eval <<'.,.,', 'lib/doily/parser.y', 20
  def _reduce_6( val, _values, result )
 result = Block.new([])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 21
  def _reduce_7( val, _values, result )
 result = Block.new(val[1])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 25
  def _reduce_8( val, _values, result )
 result = [val[0]]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 26
  def _reduce_9( val, _values, result )
 result = [val[0]] + val[1]
   result
  end
.,.,

 # reduce 10 omitted

 # reduce 11 omitted

 # reduce 12 omitted

 # reduce 13 omitted

 # reduce 14 omitted

 # reduce 15 omitted

 # reduce 16 omitted

 # reduce 17 omitted

module_eval <<'.,.,', 'lib/doily/parser.y', 44
  def _reduce_18( val, _values, result )
 result = Literal.new(val[0].to_i)
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 45
  def _reduce_19( val, _values, result )
 result = Literal.new(eval(val[0]))
   result
  end
.,.,

 # reduce 20 omitted

module_eval <<'.,.,', 'lib/doily/parser.y', 47
  def _reduce_21( val, _values, result )
 result = Object.new(val[1])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 48
  def _reduce_22( val, _values, result )
 result = Access.new(val[0], val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 49
  def _reduce_23( val, _values, result )
 result = Access.new(val[0], eval(val[2]))
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 50
  def _reduce_24( val, _values, result )
 result = Call.new(val[0], val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 54
  def _reduce_25( val, _values, result )
 result = Reference.new(val[0])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 58
  def _reduce_26( val, _values, result )
 result = Literal.new(eval(val[0]))
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 62
  def _reduce_27( val, _values, result )
 result = {}
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 63
  def _reduce_28( val, _values, result )
 result = val[0]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 64
  def _reduce_29( val, _values, result )
 result = val[0].merge(val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 68
  def _reduce_30( val, _values, result )
 result = { val[0] => val[2] }
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 72
  def _reduce_31( val, _values, result )
 result = []
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 73
  def _reduce_32( val, _values, result )
 result = [val[0]]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 74
  def _reduce_33( val, _values, result )
 result = [val[0]] + val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 78
  def _reduce_34( val, _values, result )
 result = Assignment.new(val[0], val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 82
  def _reduce_35( val, _values, result )
 result = Declaration.new(val[1])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 86
  def _reduce_36( val, _values, result )
 result = Call.new(Access.new(val[0], val[1]), [val[2]])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 90
  def _reduce_37( val, _values, result )
 result = Assignment.new(val[0], Call.new(Access.new(val[0], '+'), [Literal.new(1)]))
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 94
  def _reduce_38( val, _values, result )
 result = Conditional.new(val[2], val[4])
   result
  end
.,.,

module_eval <<'.,.,', 'lib/doily/parser.y', 95
  def _reduce_39( val, _values, result )
 result = Conditional.new(val[2], val[4], val[6])
   result
  end
.,.,

 def _reduce_none( val, _values, result )
  result
 end

  end   # class Parser

end   # module Doily
