if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
  tool = :visualcpp
else
  tool = :gcc
end

rootdir = File.expand_path(File.dirname(__FILE__))

MRuby::Build.new do |conf|
  toolchain tool

  enable_debug

  conf.gembox 'default'
  conf.gem "#{rootdir}"
end

MRuby::Build.new('test') do |conf|
  toolchain tool

  enable_debug
  enable_bintest
  enable_test

  conf.gembox 'default'
  conf.gem "#{rootdir}"
end
