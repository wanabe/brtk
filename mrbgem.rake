MRuby::Gem::Specification.new('brtk') do |spec|
  spec.license = 'MIT'
  spec.authors = 'wanabe'
  spec.bins = %w(brtk)

  spec.add_dependency "mruby-gtk3"
end
