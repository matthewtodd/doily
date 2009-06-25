require 'doily/errors'
require 'doily/parser'
require 'doily/types'

def Doily(string)
  Doily::Parser.function(string)
end
