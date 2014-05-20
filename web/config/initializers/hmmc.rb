require '../lib/hmmc.rb'
puts "hello"
HMMC.db_class = HMMC::Databases::PostGres
HMMC.env = 'development'
HMMC.db_seed

# Timeline.db_class = Timeline::Database::PostGres
