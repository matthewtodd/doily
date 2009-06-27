Given /^these documents$/ do |table|
  evaluate_table_values(table)
  @documents = table.hashes
end

When /^I get the '(.+)' view for '(.+)'$/ do |name, klass|
  @results = CouchDBView.perform do |couch_db_view|
    @documents.each { |document| Doily(chef_view(klass, name)).delegate(couch_db_view).call(document) }
  end
end

Then /^I should see$/ do |table|
  evaluate_table_values(table)
  @results.should == table.hashes
end