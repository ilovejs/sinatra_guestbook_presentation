require 'rake/testtask'
require 'fileutils'

Rake::TestTask.new do |t|
  t.name = 'test:unit'
  t.libs << "test"
  t.test_files = FileList['test/unit/test*.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.name = 'test:functional'
  t.libs << "test"
  t.test_files = FileList['test/functional/test*.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/unit/test*.rb','test/functional/test*.rb']
  t.verbose = true
end

namespace :db do
  task :reset do
    require 'db/db'
    env = Sinatra::Application.environment
    FileUtils.rm("db/#{env}.db") if File.exists?("db/#{env}.db")
  end

  task :migrate do
    require 'db/db'
    DataMapper.auto_upgrade!
  end

  task :load_sample_data do
    require 'db/db'
    require 'test/sample_data'
    env = Sinatra::Application.environment
    FileUtils.touch("db/#{env}.db") if File.exists?("db/#{env}.db")
    SampleData.load
  end

  task :prepare => ['db:reset','db:migrate','db:load_sample_data']
end

