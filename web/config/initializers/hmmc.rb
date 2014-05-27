require '../lib/hmmc.rb'
HMMC.db_class = HMMC::Databases::PostGres
HMMC.env = ENV['RAILS_ENV'] || 'development'
HMMC.db_seed

# Timeline.db_class = Timeline::Database::PostGres
