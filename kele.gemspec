#At a minimum, a RubyGem needs a .gemspec file (typically project_name.gemspec) and one Ruby file (typically lib/project_name.rb).
Gem::Specification.new do |s|
   s.name          = 'kele'
   s.version       = '0.0.1'
   s.date          = '2018-03-14'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Marco Lopez-Silva']
   s.email         = 'mlopez@fundacionidea.org.mx'
   s.files         = ['lib/kele.rb']
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
   s.add_runtime_dependency 'json', '~> 1.8'
 end
