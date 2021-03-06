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

def chdir(dir)
  return yield if dir == "."

  Dir.chdir(dir) do
    puts "(Enter #{dir}...)"
    yield
    puts "(Leave #{dir}...)"
  end
end

github "fundamental/mruby-cfunc"
github "wanabe/mruby-rubyffi-compat"
github "wanabe/mruby-gobject-introspection"
github "ppibburr/mruby-allocate"
github "ppibburr/mruby-named-constants"
github "ppibburr/mruby-girffi"
github "ppibburr/mruby-gtk3"
github "mruby/mruby"
github "wanabe/brtk-base"
github "wanabe/brtk-minimal"
github "wanabe/brtk-url-bar"

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

desc "pull"
task :pull => @vendors + ["."] do |t|
  t.prerequisites.each do |dir|
    chdir(dir) do
      sh "git pull"
    end
  end
end
