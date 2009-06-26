require 'rake/testtask'
require 'cucumber/rake/task'

rule '.rb' => ['.y'] do |task|
  sh "racc --output-file #{task.name} #{task.source}"
end

Rake::TestTask.new do |task|
  task.pattern = 'test/*_test.rb'
end

Cucumber::Rake::Task.new

task :test => 'lib/doily/parser.rb'
task :features => :test
task :default => :features