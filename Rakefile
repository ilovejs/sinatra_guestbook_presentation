require 'rake/testtask'

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

