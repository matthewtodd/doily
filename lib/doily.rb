require 'doily/errors'
require 'doily/function'
require 'doily/function_call'
require 'doily/parser'

module Doily
  def self.function(string)
    Parser.new.parse(string)
  end
end