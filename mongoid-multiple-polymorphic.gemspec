Gem::Specification.new do |s|
  s.name        = 'mongoid-multiple-polymorphic'
  s.version     = '0.0.1'
  s.summary     = "Support backward compatibility for multiple polymorphic relationships for mongoid 4"
  s.description = "In mongoid 4, a model can no longer have more than 1 field with the same polymorphic class. This brings back the functionality to allow a smooth transition from mongoid 3 to mongoid 4."
  s.authors     = ["Kirk Chen"]
  s.email       = 'chen.kirk@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://rubygems.org/gems/mongoid-multiple-polymorphic'
  s.license     = 'MIT'

  s.add_runtime_dependency 'mongoid', '>= 4.0'
end
