require 'rake'
require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

task :default => :spec

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec) do |t|
end

namespace :ci do

  desc "setup rspect for JUnit output & run specs"
  task :spec => ['ci:pre_spec', 'ci:setup:rspec', 'rake:spec']

  task :pre_spec do
    ENV['CI_REPORTS'] = 'reports'
  end
end
