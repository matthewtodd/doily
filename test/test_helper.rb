require 'test/unit'

require 'rubygems'
gem 'thoughtbot-shoulda'
require 'shoulda'
gem 'jeremymcanally-matchy'
require 'matchy'

begin
  gem 'redgreen'
rescue Gem::LoadError
  # no colors for you
else
  require 'redgreen'
end

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'doily'
