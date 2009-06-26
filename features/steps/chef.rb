Given /^these documents$/ do |table|
  @documents = table.hashes
end

When /^get the '(.+)' view for '(.+)'$/ do |view, klass|
  view     = Chef.const_get(klass)::DESIGN_DOCUMENT['views'][view]
  emitter  = SimpleEmitter.new
  function = Doily(view['map']).delegate(emitter)
  @documents.each { |document| function.call(document) }
  @results = emitter.results
end

Then /^I should see these results$/ do |table|
  @results.should == table.hashes
end