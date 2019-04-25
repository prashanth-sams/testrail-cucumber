require 'cucumber/rake/task'

task :test do |_task|
    Cucumber::Rake::Task.new do |features|
      features.cucumber_opts = "features/scenarios/*"
    end
    Rake::Task[:cucumber].invoke
end
  