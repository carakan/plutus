$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'plutus/version'
require 'date'

Gem::Specification.new do |s|
  s.name = 'plutus'
  s.version = Plutus::VERSION

  if s.respond_to? :required_rubygems_version=
    s.required_rubygems_version = Gem::Requirement.new('>= 0')
  end
  s.authors = ['Michael Bulat']
  s.date = Date.today
  s.description =
    'The plutus plugin provides a complete double entry accounting system for use in any Ruby on Rails application. The plugin follows general Double Entry Bookkeeping practices. All calculations are done using BigDecimal in order to prevent floating point rounding errors. The plugin requires a decimal type on your database as well.'
  s.email = 'mbulat@crazydogsoftware.com'
  s.extra_rdoc_files = %w[LICENSE README.markdown]
  s.add_dependency('jquery-rails', '>= 3.0')
  s.add_dependency('jquery-ui-rails', '>= 6.0.0')
  s.add_dependency('kaminari', '~> 1.0')
  s.add_dependency('rails', '> 4.0')
  s.add_development_dependency('shoulda-matchers', '~> 3.1')
  s.add_development_dependency('yard')
  s.files = Dir['{app,config,db,lib}/**/*'] + %w[LICENSE Rakefile README.markdown]
  s.homepage = 'http://github.com/mbulat/plutus'
  s.require_paths = %w[lib]
  s.required_rubygems_version = '>= 1.3.6'
  s.summary = 'A Plugin providing a Double Entry Accounting Engine for Rails'
  s.test_files = Dir['{spec}/**/*']

  if s.respond_to? :specification_version
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0')

    end
  end
end
