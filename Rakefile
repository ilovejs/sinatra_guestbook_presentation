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
  desc 'Reset development database'
  task :reset do
    FileUtils.rm("db/development.db") if File.exists?("db/development.db")
  end

  task :migrate do
    require 'db/db'
    DataMapper.auto_upgrade!
  end

  task :load_sample_data do
    require 'db/db'
    require 'test/sample_data'
    FileUtils.touch("db/development.db") if File.exists?("db/development.db")
    SampleData.load
  end
end

