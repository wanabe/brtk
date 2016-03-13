def mruby(name)
  mruby_task = "mruby-#{name}"
  task name => mruby_task
  task mruby_task => "vendor/mruby" do
    in_mruby do
      sh "./minirake #{name} #{ENV["RAKEOPT"]}"
    end
  end
end

task :default => :all

desc "all"
task :all => ["bin/brtk"] do
end

desc "brtk"
file "bin/brtk" => "vendor/mruby/bin/brtk" do
  sh "cp vendor/mruby/bin/brtk bin/brtk"
end

file "vendor/mruby/bin/brtk" => "mruby-all"
mruby :all

desc "test"
mruby :test

desc "clean"
mruby :clean

file "vendor/mruby" do
  sh "git clone https://github.com/mruby/mruby.git vendor/mruby"
end

def in_mruby(&block)
  brtk_root = File.expand_path(File.dirname(__FILE__))
  ENV["MRUBY_CONFIG"] = "#{brtk_root}/build_config.rb"
  Dir.chdir "vendor/mruby", &block
end
