require 'rake/testtask'

rule '.rb' => ['.y'] do |task|
  sh "racc --output-file #{task.name} #{task.source}"
end

Rake::TestTask.new do |task|
  task.pattern = 'test/*_test.rb'
end

task :test => 'lib/doily/parser.rb'
task :default => :test