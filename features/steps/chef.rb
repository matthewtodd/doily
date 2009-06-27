Given /^these documents$/ do |table|
  evaluate_table_values(table)
  @documents = table.hashes
end

When /^I list all the views for '(.+)'$/ do |klass|
  @results = []
  chef_view_functions(klass).keys.sort.each { |key| @results.push('name' => key)}
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