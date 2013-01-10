namespace :db do
  desc 'Completely rebuild database'
  task :rebuild do
    ['db:drop', 'db:create', 'db:migrate', 'db:seed'].each do |name|
      Rake::Task[name].invoke
    end
  end
end