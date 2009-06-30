# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{doily}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Todd"]
  s.date = %q{2009-06-30}
  s.email = %q{matthew.todd@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["Rakefile", "README.rdoc", "features/chef_nodes.feature", "features/chef_openid_registrations.feature", "features/chef_roles.feature", "features/steps", "features/steps/chef.rb", "features/support", "features/support/environment.rb", "features/support/helpers.rb", "lib/doily", "lib/doily/errors.rb", "lib/doily/parser.rb", "lib/doily/parser.y", "lib/doily/types", "lib/doily/types/access.rb", "lib/doily/types/array.rb", "lib/doily/types/assignment.rb", "lib/doily/types/binding.rb", "lib/doily/types/block.rb", "lib/doily/types/call.rb", "lib/doily/types/conditional.rb", "lib/doily/types/declaration.rb", "lib/doily/types/function.rb", "lib/doily/types/literal.rb", "lib/doily/types/loop.rb", "lib/doily/types/object.rb", "lib/doily/types/reference.rb", "lib/doily/types.rb", "lib/doily.rb", "test/doily_hash_test.rb", "test/doily_test.rb", "test/test_helper.rb"]
  s.rdoc_options = ["--main", "README.rdoc", "--title", "doily-0.1.2", "--inline-source", "--line-numbers", "--all"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{A Javascript (function) interpreter for Ruby.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<chef>, [">= 0"])
      s.add_development_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<chef>, [">= 0"])
      s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<chef>, [">= 0"])
    s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end
