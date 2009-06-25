require 'doily/parser'

module Doily
  def self.function(string)
    Parser.new.parse(string)
  end
end