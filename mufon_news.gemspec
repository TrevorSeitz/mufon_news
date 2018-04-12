
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mufon_news/version"

Gem::Specification.new do |spec|
  spec.name          = "mufon_news"
  spec.version       = MufonNews::VERSION
  spec.authors       = ["Trevor Seitz"]
  spec.email         = ["trevinla@gmail.com"]

  spec.summary       = "A CLI Web Scraper for the mufon.com website"
  spec.description   = "This CLI offers the options to read the most recent news stories about UFOs or MUFON. 
                        It also offers you the chance to see the most recent UFO sighting reports"
  spec.homepage      = "https://github.com/TrevorSeitz/mufon_news"
  
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(/^bin\//) { "run_mufon_scraper "}
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_dependency "nokogiri", "~> 1.8"
end
