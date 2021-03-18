require_relative 'lib/football/butler/version'

Gem::Specification.new do |spec|
  spec.name          = "football-butler"
  spec.version       = Football::Butler::VERSION
  spec.authors       = ["Jörg Kirschstein"]
  spec.email         = ["info@joerg-kirschstein.de"]

  spec.summary       = 'Football data via API'
  spec.description   = 'Get data from https://www.football-data.org'
  spec.homepage      = "https://github.com/frontimax/football-butler"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
