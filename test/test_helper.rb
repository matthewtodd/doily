require 'test/unit'

require 'rubygems'
gem 'thoughtbot-shoulda'
require 'shoulda'
gem 'jeremymcanally-matchy'
require 'matchy'

if $stdin.tty?
  begin
    gem 'redgreen'
  rescue Gem::LoadError
    # no colors for you
  else
    require 'redgreen'
  end
end

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'doily'
