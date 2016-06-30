# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'test/methadone/cli/app/one/version'

Gem::Specification.new do |spec|
  spec.name          = 'test-methadone-cli-app-one'
  spec.license       = 'mit'
  spec.version       = Test::Methadone::Cli::App::One::VERSION
  spec.authors       = ['Andrew Faulkner']
  spec.email         = ['andfaulkner@gmail.com']

  spec.summary       = %(Experimental task to explore methadone for building Ruby cli tools)
  spec.description   = %(I use Ruby frequently for devops-type tasks and irritating system chores.
                         However, I'm still reliant on bash for a lot - there are gaps Ruby just
                         hasn't quite been able to fill. A lot of this boils down to 2 main issues:
                         1\) Ruby's poor option parsing. OptionParser is just way too painful and
                             verbose, which leads me to avoid it until the last possible second.
                             Cli args are so essential for system scripting, trying to minimize my
                             need for them has caused a lot of pain;
                         2\) Ruby has a binary-star orbit with TDD/BDD, but this sort of gets
                             thrown out the window with short system scripts, because setting up a
                             test framework for tiny scripts takes so much effort. A generator is
                             needed.
                         3\) Boilerplate. Ruby is on-the-whole very light on boilerplate, but Bash
                             has basically NO boilerplate, so for small scripts it still often wins.
                             I only switch to Ruby when scripts go from small-->medium. I'd prefer
                             to use Ruby for small tasks as well, leaving bash only in use for tiny
                             (5 line or less) scripts and one-liners.
                         I am evaluating methadone to see if it can solve my problems here.)

  spec.homepage      = 'https://github.com/andfaulkner/sublime-dev-environment-snippets'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'NONE: THIS IS A LOCAL-ONLY SCRIPT'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/})}
  # path to executable scripts - usually bin
  spec.bindir        = 'bin'
  # Executables included in the gem. Can only be executable Ruby files. All must be in the bindir
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  # Paths in the gem to add to $LOAD_PATH when this gem is activated.
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_dependency('methadone', '~> 1.9.2')
  spec.add_development_dependency('test-unit')
  spec.add_development_dependency('rspec', '~> 3')
end
