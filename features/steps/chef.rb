Given /^these documents$/ do |table|
  table.raw[0].each { |column| table.map_column!(column) { |value| eval(value) }}
  @documents = table.hashes
end

class SimpleEmitter
  def initialize
    @results = []
  end

  def emit(key, value)
    @results.push('key' => key, 'value' => value)
  end

  def results
    @results
  end
end

When /^I get the '(.+)' view for '(.+)'$/ do |view, klass|
  view     = Chef.const_get(klass)::DESIGN_DOCUMENT['views'][view]
  emitter  = SimpleEmitter.new
  function = Doily(view['map']).delegate(emitter)
  @documents.each { |document| function.call(document) }
  @results = emitter.results
end

Then /^I should see$/ do |table|
  table.raw[0].each { |column| table.map_column!(column) { |value| eval(value) }}
  @results.should == table.hashes
end