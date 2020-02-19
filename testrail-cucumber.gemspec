lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "testrail-cucumber/version"

Gem::Specification.new do |s|
    s.name          = "testrail-cucumber"
    s.version       = TestrailCucumber::VERSION
    s.licenses      = ['MIT']
    s.author        = ["Prashanth Sams"]
    s.email         = ['sams.prashanth@gmail.com']
    s.summary       = "Sync cucumber automation test results with your testrail suite"
    s.homepage      = "https://github.com/prashanth-sams/testrail-cucumber"
    s.files         = ["lib/testrail-cucumber.rb", "lib/testrail-cucumber/api-client.rb", "lib/testrail-cucumber/update-testrails.rb", "lib/testrail-cucumber/version.rb"]
    s.require_paths = ["lib"]
    s.metadata      = { "documentation_uri" => "https://www.rubydoc.info/github/prashanth-sams/testrail-cucumber/master", "source_code_uri" => "https://github.com/prashanth-sams/testrail-cucumber", "bug_tracker_uri" => "https://github.com/prashanth-sams/testrail-cucumber/issues" }

    s.add_development_dependency "bundler"
    s.add_development_dependency "rake"
    s.add_development_dependency "rspec", "~> 3.0"
    s.add_development_dependency "cucumber"
    s.add_development_dependency "selenium-webdriver"
    s.add_development_dependency "byebug", "~> 11.0"
end