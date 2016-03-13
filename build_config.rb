class MRuby::Build
  def try_gem(path)
    gem path if File.exist? path
  end
end

if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
  tool = :visualcpp
else
  tool = :gcc
end

rootdir = File.expand_path(File.dirname(__FILE__))
vendor =  "#{rootdir}/vendor"

MRuby::Build.new do |conf|
  toolchain tool

  enable_debug

  # For mruby-girffi
  conf.cc.flags << "-DMRB_INT64"

  conf.gembox 'default'
  conf.gem "#{rootdir}"
  conf.try_gem "#{vendor}/mruby-cfunc"
  conf.try_gem "#{vendor}/mruby-rubyffi-compat"
  conf.try_gem "#{vendor}/mruby-gobject-introspection"
  conf.try_gem "#{vendor}/mruby-allocate"
  conf.try_gem "#{vendor}/mruby-named-constants"
  conf.try_gem "#{vendor}/mruby-girffi"
  conf.try_gem "#{vendor}/mruby-gtk3"
end
