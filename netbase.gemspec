Gem::Specification.new do |s|
  s.name        = 'netbase'
  s.version     = '0.0.0'
  s.date        = '2020-12-07'
  s.summary     = "Netbase Insight Explorer API"
  s.description = "A ruby wrapper for this tool from Netbase Quid"
  s.authors     = ["Paul Dornfeld"]
  s.email       = 'pdornfel@gmail.com'
  s.files       = Dir['lib/   *.rb'] + Dir['bin/*']
  s.executables << 'netbase'
  # s.files       = ["lib/netbase.rb"]
  s.homepage    = 'https://rubygems.org/gems/netbase'
  s.license     = 'MIT'

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-nc"
  s.add_development_dependency "pry"
end
