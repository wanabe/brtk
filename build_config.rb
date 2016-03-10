if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
  tool = :visualcpp
else
  tool = :gcc
end
rootdir = File.expand_path(File.dirname(__FILE__))

MRuby::Build.new("brtk") do |conf|
  toolchain tool

  enable_debug

  conf.gembox 'default'
  conf.gem "#{rootdir}"
end
