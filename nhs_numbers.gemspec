Gem::Specification.new do |s|
  s.name        = 'nhs_numbers'
  s.version     = '0.2.0'
  s.date        = '2010-04-28'
  s.summary     = 'Utility library to generating and validating NHS numbers'
  s.description = 'A utility library to generate and validate UK NHS numbers.'
  s.authors     = ['Substrakt Health']
  s.email       = 'heath@substrakt.com'
  s.license     = 'GNU GPLv3'

  s.add_dependency 'activemodel', '~> 5.0'
  s.add_development_dependency 'minitest'
end
