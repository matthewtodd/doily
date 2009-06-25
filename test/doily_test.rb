require File.join(File.dirname(__FILE__), 'test_helper')

class DoilyTest < Test::Unit::TestCase
  should 'handle a no-arg, no-statement function' do
    Doily.function('function() {}').call.should == nil
  end

  should 'handle a no-arg function calling another' do
    binding = mock
    binding.expects(:foo)
    Doily.function('function() { foo() }').bind(binding).call
  end
end