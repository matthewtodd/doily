require File.join(File.dirname(__FILE__), 'test_helper')

class DoilyTest < Test::Unit::TestCase
  should 'handle a no-arg, no-statement function' do
    Doily.function('function() {}').call.should == nil
  end

  should_eventually 'handle a no-arg function returning an integer' do
    Doily.function('function() { return 1 }').call.should == 1
  end
end