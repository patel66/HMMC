require 'pry-debugger'
require 'active_model'
require 'active_record'
require 'active_record_tasks'
require 'yaml'
require 'timecop'
require 'securerandom'
require 'time'


module HMMC
  def self.db
    @db_class ||= Databases::InMemory
    @__db_instance ||= @db_class.new(@env || 'test')
     # @__db_instance ||= Databases::SQLiteDB.new
  end

  def self.db_class=(db_class)
    @db_class = db_class
  end

  def self.env=(env_name)
    @env = env_name
  end

end




# module Timeline
#   def self.db
#     @db_class ||= Database::InMemory
#     @__db_instance ||= @db_class.new(@env || 'test')
#   end

#   def self.db_class=(db_class)
#     @db_class = db_class
#   end

#   def self.env=(env_name)
#     @env = env_name
#   end


# module HMMC
#   def self.db
#     @__db_instance ||= Databases::InMemory.new
#     @__db_instance ||= @db_class.new(@env || 'test')
#   end

#   def self.db_class=(db_class)
#     @db_class = db_class
#   end

#   def self.env=(env_name)
#     @env = env_name
#   end

# end
####################





####################
require_relative "hmmc/use_case.rb"
Dir[File.dirname(__FILE__) + '/use_cases/*.rb'].each {|file| require_relative file }
Dir[File.dirname(__FILE__) + '/entities/*.rb'].each {|file| require_relative file }
Dir[File.dirname(__FILE__) + '/databases/*.rb'].each {|file| require_relative file }

require_relative "hmmc/entity.rb"
require_relative "hmmc/use_case.rb"
require_relative "hmmc/databases/in_memory.rb"
require_relative "hmmc/databases/sqlite_db.rb"

require_relative "hmmc/entities/user.rb"
require_relative "hmmc/entities/school.rb"
require_relative "hmmc/entities/class_room.rb"
require_relative "hmmc/entities/student_ranking.rb"
require_relative "hmmc/entities/activity.rb"

# usecases
require_relative "hmmc/use_cases/add_miles_class.rb"
require_relative "hmmc/use_cases/get_miles.rb"
require_relative "hmmc/use_cases/create_user.rb"
require_relative "hmmc/use_cases/login_user.rb"
require_relative "hmmc/use_cases/check_sign_in.rb"
require_relative "hmmc/use_cases/sign_in.rb"
require_relative "hmmc/use_cases/sign_up.rb"
require_relative "hmmc/use_cases/sign_out.rb"
require_relative "hmmc/use_cases/add_activity.rb"
require_relative "hmmc/use_cases/create_class_room.rb"
require_relative "hmmc/use_cases/set_goal.rb"
require_relative "hmmc/use_cases/create_school.rb"
