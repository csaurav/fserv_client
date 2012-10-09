# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "fserv_client"
  s.version     = "0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Callum Jones", "Sam Winterton"]
  s.email       = ["callum.jones@corpgovrisk.com", "sam.winterton@corpgovrisk.com"]
  s.homepage    = "http://www.corpgovrisk.com"
  s.summary     = "Client for interacting with fserv"
                  
  s.description = "Client for interacting with fserv"
                  
                

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency("rest-client")
 
  s.files        = Dir.glob("lib/**/*") +
    %w(CHANGELOG.md README.md Rakefile)
  s.require_path = 'lib'
end
