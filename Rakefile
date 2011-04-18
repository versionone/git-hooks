require 'rake'
require 'rspec/core/rake_task'

task :default => :spec

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec) do |t|

end

namespace :ci do
  task :setup do
    require 'bundler'
    Bundler.setup
  end
end
