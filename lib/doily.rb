require 'doily/errors'
require 'doily/parser'
require 'doily/types'

def Doily(string, binding=nil)
  Doily::Parser.function(string).bind(binding)
end
