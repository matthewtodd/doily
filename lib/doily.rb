require 'doily/errors'
require 'doily/function'
require 'doily/function_call'
require 'doily/parser'

def Doily(string, binding=nil)
  Doily::Parser.function(string).bind(binding)
end
