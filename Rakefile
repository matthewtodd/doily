require 'rubygems'
require 'rake/rdoctask'
require 'rake/testtask'
require 'cucumber/rake/task'

spec = Gem::Specification.new do |s|
  s.name             = 'doily'
  s.version          = '0.1.2'
  s.summary          = 'A Javascript (function) interpreter for Ruby.'
  s.files            = FileList['Rakefile', '*.rdoc', 'features/**/*', 'lib/**/*', 'test/**/*'].to_a
  s.rdoc_options     = %W[--main README.rdoc --title #{s.name}-#{s.version} --inline-source --line-numbers --all]
  s.extra_rdoc_files = FileList['*.rdoc'].to_a
  s.author           = 'Matthew Todd'
  s.email            = 'matthew.todd@gmail.com'

  s.add_development_dependency 'chef'
  s.add_development_dependency 'jeremymcanally-matchy'
  s.add_development_dependency 'thoughtbot-shoulda'
end

desc 'Generate documentation'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir   = 'docs'
  rdoc.options    = spec.rdoc_options
  rdoc.rdoc_files = FileList['*.rdoc', 'lib/**/*.rb'].to_a
end

desc 'Generate a gemspec file'
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end

rule '.rb' => ['.y'] do |task|
  sh "racc --output-file #{task.name} #{task.source}"
end

Rake::TestTask.new do |task|
  task.pattern = 'test/*_test.rb'
end

Cucumber::Rake::Task.new

task :test     => 'lib/doily/parser.rb'
task :features => 'lib/doily/parser.rb'
task :default  => [:test, :features]
