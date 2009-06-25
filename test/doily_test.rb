require File.join(File.dirname(__FILE__), 'test_helper')

class DoilyTest < Test::Unit::TestCase
  should 'handle nothing' do
    Doily('function() {}').call.should == nil
  end

  context 'delegation to a ruby object' do
    setup do
      @delegate = Class.new do
        def echo(*args)
          args
        end
      end.new
    end

    should 'handle calling a function' do
      Doily('function() { echo() }', @delegate).call.should == []
    end

    should 'handle calling a function with one literal argument' do
      Doily('function() { echo("foo") }', @delegate).call.should == ['foo']
    end

    should 'handle calling a function with many literal arguments' do
      Doily('function() { echo("foo", 42) }', @delegate).call.should == ['foo', 42]
    end

    should 'handle calling a function with a value from the binding' do
      Doily('function(document) { echo(document) }', @delegate).call('key' => 'value').should == [{'key' => 'value'}]
    end

    should 'handle calling a function with a property access on a variable in the binding' do
      Doily('function(document) { echo(document.key) }', @delegate).call('key' => 'value').should == ['value']
    end

    should 'handle calling a function with an invocation on a variable in the binding' do
      Doily('function(document) { echo(document.keys()) }', @delegate).call('key' => 'value').should == [['key']]
    end
  end
end
