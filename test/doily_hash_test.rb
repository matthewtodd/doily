require File.join(File.dirname(__FILE__), 'test_helper')

class DoilyHashTest < Test::Unit::TestCase
  should 'handle a bare empty hash' do
    Doily('{}').should == {}
  end

  should 'handle a simple hash' do
    Doily('{"a":true, "b":42}').should == { 'a' => true, 'b' => 42 }
  end

  should 'handle a hash with an array' do
    Doily('{"a":true, "b":[1, 2, 3]}').should == { 'a' => true, 'b' => [1, 2, 3] }
  end

  should 'handle a nested hash' do
    Doily('{"a":true, "b":{"a":true, "b":[1, 2, 3]}}').should == { 'a' => true, 'b' => { 'a' => true, 'b' => [1, 2, 3] }}
  end
end
