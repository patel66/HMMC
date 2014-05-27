require '../lib/hmmc.rb'
HMMC.db_class = HMMC::Databases::PostGres
HMMC.env = ENV['RAILS_ENV'] || 'development'

# Timeline.db_class = Timeline::Database::PostGres
