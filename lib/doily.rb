require 'doily/call'
require 'doily/errors'
require 'doily/function'
require 'doily/parser'

module Doily
  def self.function(string)
    Parser.new.parse(string)
  end
end