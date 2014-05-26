# require 'active_record_tasks'

# ActiveRecordTasks.configure do |config|
#   # These are all the default values
#   config.db_dir = 'db'
#   config.db_config_path = 'db/config.yml'
#   config.env = 'test'
# end

# # Run this AFTER you've configured
# ActiveRecordTasks.load_tasks


require 'active_record_tasks'


ActiveRecordTasks.configure do |config|
  # These are all the default values
  config.db_dir = 'db'
  config.db_config_path = 'db/config.yml'
  # In terminal, can set environment, for example, by doing DB_ENV=test
  config.env = ENV['DB_ENV'] || 'test'
  # config.env = 'test'
end

# Run this AFTER you've configured
ActiveRecordTasks.load_tasks
Rake::Task["db:seed"].clear

task :load_app do
  puts "Loading application"
  # [code to require and set up your application would go here]
  # require './lib/my_app.rb'
  require './lib/hmmc.rb'
end

namespace :db do

  task :seed => ['db:migrate', :load_app] do
    puts "Seeding database"
    # [code to seed your database would go here]
    # MyApp.db.create_user(:name => 'Bob')
    # rake db:seed


    puts HMMC.db.get_all_schools
  end
end
