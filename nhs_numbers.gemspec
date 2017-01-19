Gem::Specification.new do |s|
  s.name        = 'nhs_numbers'
  s.version     = '0.0.0'
  s.date        = '2010-04-28'
  s.summary     = 'Utility library to generating and validating NHS numbers'
  s.description = 'A simple hello world gem'
  s.authors     = ['Substrakt Health']
  s.email       = 'heath@substrakt.com'
  s.license     = 'MIT'

  s.add_dependency 'activemodel', '~> 5.0'
  s.add_development_dependency 'minitest'
end
