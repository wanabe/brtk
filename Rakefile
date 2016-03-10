task :default => :all

desc "all"
task :all => ["bin/brtk"] do
end

desc "brtk"
file "bin/brtk" => "vendor/mruby/bin/brtk" do
  sh "cp vendor/mruby/bin/brtk bin/brtk"
end

file "vendor/mruby/bin/brtk" => "vendor/mruby" do
  in_mruby do
    sh "make"
  end
end


desc "test"
task :test => "vendor/mruby" do
  in_mruby do
    sh "make test"
  end
end

desc "clean"
task :clean do
  in_mruby do
    sh "make clean"
  end
end

file "vendor/mruby" do
  sh "git clone https://github.com/mruby/mruby.git vendor/mruby"
end

def in_mruby(&block)
  brtk_root = File.expand_path(File.dirname(__FILE__))
  ENV["MRUBY_CONFIG"] = "#{brtk_root}/build_config.rb"
  Dir.chdir "vendor/mruby", &block
end
