Gem::Specification.new do |s|
  s.name          = 'kele'
  s.version       = '0.0.1'
  s.date          = '2017-03-07'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Thomas Lawton']
  s.email         = 'thomaslawton91@gmail.com'
  s.files         = ['lib/kele.rb', 'lib/kele/roadmap.rb', 'lib/kele/messages.rb', 'lib/kele/submissions.rb']
  s.require_paths = ["lib"]
  s.homepage      =
    'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 2.0'
end
