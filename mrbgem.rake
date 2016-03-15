MRuby::Gem::Specification.new('brtk') do |spec|
  spec.license = 'MIT'
  spec.authors = 'wanabe'
  spec.bins = %w(brtk)

  spec.add_dependency "mruby-gtk3"
  spec.add_dependency "brtk-base"
  spec.add_dependency "brtk-minimal"
  spec.add_dependency "brtk-url-bar"
end
