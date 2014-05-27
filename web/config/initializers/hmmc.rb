require File.expand_path('../../../../lib/hmmc.rb', __FILE__)
HMMC.db_class = HMMC::Databases::PostGres
HMMC.env = ENV['RAILS_ENV'] || 'development'

# Timeline.db_class = Timeline::Database::PostGres
