require File.join(File.dirname(__FILE__), 'test_helper')

class DoilyTest < Test::Unit::TestCase
  should 'handle nothing' do
    Doily('function() {}').call.should == nil
  end

  context 'delegation to a ruby object' do
    setup do
      @delegate = Class.new do
        def echo(*args); args; end
      end.new
    end

    should 'handle calling a function' do
      Doily('function() { echo(); }').delegate(@delegate).call.should == []
    end

    should 'handle calling a function with one literal argument' do
      Doily('function() { echo("foo"); }').delegate(@delegate).call.should == ['foo']
    end

    should 'handle calling a function with many literal arguments' do
      Doily('function() { echo("foo", 42); }').delegate(@delegate).call.should == ['foo', 42]
    end

    should 'handle calling a function with a value from the binding' do
      Doily('function(document) { echo(document); }').delegate(@delegate).call('key' => 'value').should == [{'key' => 'value'}]
    end

    should 'handle calling a function with a property access on a variable in the binding' do
      Doily('function(document) { echo(document.key); }').delegate(@delegate).call('key' => 'value').should == ['value']
    end

    should 'handle calling a function with an invocation on a variable in the binding' do
      Doily('function(document) { echo(document.keys()); }').delegate(@delegate).call('key' => 'value').should == [['key']]
    end
  end

  should 'handle a boolean comparison of integers' do
    Doily('function() { 1 == 1; }').call.should == true
  end

  should 'handle a boolean comparison of strings' do
    Doily('function() { "foo" == "foo"; }').call.should == true
  end

  should 'handle a boolean comparison with calls' do
    Doily('function() { "foo".length() == 3; }').call.should == true
  end

  should 'handle a false boolean comparison' do
    Doily('function() { "foo" == "bar"; }').call.should == false
  end

  should 'handle a negative boolean comparison' do
    Doily('function() { 1 < 2; }').call.should == true
  end

  should 'handle an if statement' do
    Doily('function() { if (1 == 1) { 42; } }').call.should == 42
  end

  should 'handle a negative if statement' do
    Doily('function() { if (1 == 2) { 42; } }').call.should == nil
  end

  should 'handle an else statement' do
    Doily('function() { if (1 == 2) { 42; } else { "foo"; } }').call.should == 'foo'
  end

  should 'handle variable declaration' do
    Doily('function() { var foo = "42"; }').call.should == '42'
  end

  should 'handle variable declaration with continuing statements' do
    Doily('function() { var foo = "42"; foo.length(); }').call.should == 2
  end

  should 'handle hash literals' do
    Doily('function() { {"name":"Bob", "age":42 }; }').call.should == { 'name' => 'Bob', 'age' => 42 }
  end

  should 'handle square-bracket hash access' do
    Doily('function(document) { document["key"]; }').call('key' => 'value').should == 'value'
  end

  should 'handle hash assignment' do
    Doily('function() { var doc = {}; doc["key"] = "value"; doc; }').call.should == { 'key' => 'value' }
  end

  should 'handle literal true' do
    Doily('function() { true; }').call.should == true
  end

  should 'handle literal false' do
    Doily('function() { false; }').call.should == false
  end

  should 'handle single-quoted strings' do
    Doily("function() { 'foo'; }").call.should == 'foo'
  end

  should 'handle increment operator' do
    Doily('function() { var i = 0; i++; i; }').call.should == 1
  end

  context 'for loop' do
    setup do
      @counter = Class.new do
        attr_reader :count

        def initialize
          @count = 0
        end

        def tick
          @count = @count + 1
        end
      end.new
    end

    should 'work' do
      Doily('function() { for (var i=0; i < 3; i++) { tick(); } }').delegate(@counter).call
      @counter.count.should == 3
    end
  end
end
