require File.join(File.dirname(__FILE__), 'test_helper')

class DoilyTest < Test::Unit::TestCase
  context 'with a mock binding' do
    setup do
      @binding = mock
    end

    should 'handle nothing' do
      Doily('function() {}').call.should == nil
    end

    should 'handle calling a function' do
      @binding.expects(:foo)
      Doily('function() { foo() }', @binding).call
    end

    should 'handle calling a function with one literal argument' do
      @binding.expects(:foo).with('bar')
      Doily('function() { foo("bar") }', @binding).call
    end

    should 'handle calling a function with many literal arguments' do
      @binding.expects(:foo).with('bar', 42)
      Doily('function() { foo("bar", 42) }', @binding).call
    end

    should 'handle calling a function with a value from the binding' do
      @binding.expects(:bar).returns(42)
      @binding.expects(:foo).with(42)
      Doily('function() { foo(bar) }', @binding).call
    end

    should 'handle calling a function with a property lookup on a variable in the binding' do
      bar = mock
      bar.expects(:quux).returns(42)
      @binding.expects(:bar).returns(bar)
      @binding.expects(:foo).with(42)
      Doily('function() { foo(bar.quux) }', @binding).call
    end
  end
end
