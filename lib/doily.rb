require 'doily/binding'
require 'doily/errors'
require 'doily/parser'
require 'doily/types'

def Doily(string, delegate=nil)
  Doily::Parser.function(string).bind(Doily::DelegateBinding.new(delegate))
end
