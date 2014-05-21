require 'pry-debugger'
require 'active_model'
require 'active_record'
require 'active_record_tasks'
require 'yaml'
require 'timecop'
require 'securerandom'
require 'time'
require 'bcrypt'


module HMMC
  def self.db
    @db_class ||= HMMC::Databases::PostGres
    @__db_instance ||= @db_class.new(@env || 'test')
  end

  def self.db_class=(db_class)
    @db_class = db_class
  end

  def self.env=(env_name)
    @env = env_name
  end

  def self.db_seed
    HMMC.db.clear_everything

    x = HMMC.db.create_school(name: 'Kent Academy', city: "Sugar Land", state: "TX", zipcode: 77478, lat: 29.61962, long: -95.60306, street: "14031 Southwest Freeway" )
    HMMC.db.create_school(name: 'Excelsior Academy', city: "Sugar Land", state: "TX", zipcode: 77478, lat: 29.627253, long: -95.60415, street: "104 Industrial Blvd, Suite Q" )

    HMMC.db.create_school(name: 'Foothills christian Junior High School', city: 'La Mesa', state: "CA", zipcode: 91942, lat: 32.77495, long:-117.01467, street: "9407 Jericho Road Road")
    HMMC.db.create_school(name: 'East Region Community School Of Greater El Cajon', city: "La Mesa", state: 'CA', zipcode: 91942, lat: 32.774567, long: -117.01549)
    HMMC.db.create_school(name: 'Northmont Elementary School', city: "La Mesa", state: 'CA', zipcode: 91942, lat: 32.790028, long: -116.99396, street: "9405 Gregory Street")

    HMMC.db.create_school(name: 'Southeast Middle School', city: "Austin", state: 'TX', zipcode: 78703, lat: 30.2723, long: -97.7559, street: "1111 W 6th St")
    HMMC.db.create_school(name: 'North Central Elementary School', city: "Austin", state: 'TX', zipcode: 78703, lat: 30.2723, long: -97.7559, street: "1111 W 6th St")
    HMMC.db.create_school(name: 'Austin H S', city: "Austin", state: 'TX', zipcode: 78703, lat: 30.274014, long: -97.76744, street: "1715 W Cesar Chavez")

    HMMC.db.create_school(name: 'Hostos-Lincoln Academy of Science', city: "Bronx", state: 'NY', zipcode: 10451, lat: 40.818172, long: -73.92789, street: "475 Grand Concourse")
    HMMC.db.create_school(name: 'Urban Assembly School For Careers In Sports', city: "Bronx", state: 'NY', zipcode: 10451, lat: 40.82278, long: -73.92348, street: "730 Concourse Village W")
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
