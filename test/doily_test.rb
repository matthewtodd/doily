require File.join(File.dirname(__FILE__), 'test_helper')

class DoilyTest < Test::Unit::TestCase
  should 'handle nothing' do
    Doily('function() {}').call.should == nil
  end

  should 'handle calling a function' do
    binding = mock
    binding.expects(:foo)
    Doily('function() { foo() }', binding).call
  end

  should 'handle calling a function with one literal argument' do
    binding = mock
    binding.expects(:foo).with('bar')
    Doily('function() { foo("bar") }', binding).call
  end

  should 'handle calling a function with many literal arguments' do
    binding = mock
    binding.expects(:foo).with('bar', 42)
    Doily('function() { foo("bar", 42) }', binding).call
  end

  should 'handle calling a function with a value from the binding' do
    binding = mock
    binding.expects(:bar).returns(42)
    binding.expects(:foo).with(42)
    Doily('function() { foo(bar) }', binding).call
  end
end