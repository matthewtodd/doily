require 'rubygems'
gem 'jeremymcanally-matchy'
require 'matchy'
gem 'chef'
require 'chef'
require 'chef/role'

$:.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
require 'doily'

class SimpleEmitter
  def initialize
    @results = []
  end

  def emit(key, value)
    @results.push('key' => key, 'value' => value)
  end

  def results
    @results
  end
end
