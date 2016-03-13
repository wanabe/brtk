def mruby(name)
  mruby_task = "mruby-#{name}"
  task name => mruby_task
  task mruby_task => "vendor/mruby" do
    in_mruby do
      sh "./minirake #{name} #{ENV["RAKEOPT"]}"
    end
  end
end

def in_mruby(&block)
  brtk_root = File.expand_path(File.dirname(__FILE__))
  ENV["MRUBY_CONFIG"] = "#{brtk_root}/build_config.rb"
  Dir.chdir "vendor/mruby", &block
end

def github(repo)
  base = File.basename(repo, ".git")
  dir = "vendor/#{base}"
  @vendors ||= []
  @vendors << dir
  file dir do
    sh "git clone https://github.com/#{repo}.git #{dir}"
  end
end

github "mobiruby/mruby-cfunc"
github "ppibburr/mruby-allocate"
github "ppibburr/mruby-girffi"
github "ppibburr/mruby-gobject-introspection"
github "ppibburr/mruby-gtk3"
github "ppibburr/mruby-named-constants"
github "ppibburr/mruby-rubyffi-compat"
github "mruby/mruby"

task :default => :all

desc "all"
task :all => ["bin/brtk"] do
end

desc "brtk"
file "bin/brtk" => "vendor/mruby/bin/brtk" do
  sh "cp vendor/mruby/bin/brtk bin/brtk"
end

file "vendor/mruby/bin/brtk" => @vendors + ["mruby-all"]
mruby :all

desc "test"
mruby :test

desc "clean"
mruby :clean
