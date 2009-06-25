require File.join(File.dirname(__FILE__), 'test_helper')

class DoilyTest < Test::Unit::TestCase
  should 'handle a no-arg, no-statement function' do
    Doily('function() {}').call.should == nil
  end

  should 'handle a no-arg function calling another' do
    binding = mock
    binding.expects(:foo)
    Doily('function() { foo() }', binding).call
  end

  should 'handle a no-arg function calling a function with a literal argument' do
    binding = mock
    binding.expects(:foo).with('bar')
    Doily('function() { foo("bar") }', binding).call
  end

  should 'handle a no-arg function calling a function with many literal arguments' do
    binding = mock
    binding.expects(:foo).with('bar', 42)
    Doily('function() { foo("bar", 42) }', binding).call
  end
end