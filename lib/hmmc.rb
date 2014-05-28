require 'pry-debugger'
require 'active_model'
require 'active_record'
require 'active_record_tasks'
require 'erb'
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

    HMMC.db.create_school(name: 'Kent Academy', city: "Sugar Land", state: "TX", zipcode: 77478, lat: 29.61962, long: -95.60306, street: "14031 Southwest Freeway" )
    HMMC.db.create_school(name: 'Excelsior Academy', city: "Sugar Land", state: "TX", zipcode: 77478, lat: 29.627253, long: -95.60415, street: "104 Industrial Blvd, Suite Q" )
    HMMC.db.create_school(name: 'Foothills christian Junior High School', city: 'La Mesa', state: "CA", zipcode: 91942, lat: 32.77495, long:-117.01467, street: "9407 Jericho Road Road")
    HMMC.db.create_school(name: 'East Region Community School Of Greater El Cajon', city: "La Mesa", state: 'CA', zipcode: 91942, lat: 32.774567, long: -117.01549)
    HMMC.db.create_school(name: 'Northmont Elementary School', city: "La Mesa", state: 'CA', zipcode: 91942, lat: 32.790028, long: -116.99396, street: "9405 Gregory Street")
    HMMC.db.create_school(name: 'Southeast Middle School', city: "Austin", state: 'TX', zipcode: 78703, lat: 30.2723, long: -97.7559, street: "1111 W 6th St")
    HMMC.db.create_school(name: 'North Central Elementary School', city: "Austin", state: 'TX', zipcode: 78703, lat: 30.2723, long: -97.7559, street: "1111 W 6th St")
    HMMC.db.create_school(name: 'Austin H S', city: "Austin", state: 'TX', zipcode: 78703, lat: 30.274014, long: -97.76744, street: "1715 W Cesar Chavez")
    HMMC.db.create_school(name: 'Hostos-Lincoln Academy of Science', city: "Bronx", state: 'NY', zipcode: 10451, lat: 40.818172, long: -73.92789, street: "475 Grand Concourse")
    HMMC.db.create_school(name: 'Urban Assembly School For Careers In Sports', city: "Bronx", state: 'NY', zipcode: 10451, lat: 40.82278, long: -73.92348, street: "730 Concourse Village W")

    HMMC.db.create_school(name: 'St. Austin Catholic School', city: "Austin", state: "TX", zipcode: 78705, lat: 30.2795675, long: -97.7340782, street: "1911 San Antonio St" )
    HMMC.db.create_school(name: 'Ridgetop Elementary School', city: "Austin", state: "TX", zipcode: 78751, lat: 30.311517, long: -97.716143, street: "5005 Caswell Ave" )
    HMMC.db.create_school(name: 'Kealing Middle School', city: "Austin", state: "TX", zipcode: 78702, lat: 30.269754, long: -97.722135, street: "1607 Pennsylvania Ave" )
    HMMC.db.create_school(name: 'Martin Middle School', city: "Austin", state: "TX", zipcode: 78702, lat: 30.252654, long: -97.730451, street: "1601 Haskell St" )
    HMMC.db.create_school(name: 'Metz Elementary School', city: "Austin", state: "TX", zipcode: 78702, lat: 30.254583, long: -97.722044, street: "84 Robert Martinez Jr St" )
    HMMC.db.create_school(name: 'Travis Heights Elementary School', city: "Austin", state: "TX", zipcode: 78704, lat: 30.241598, long: -97.746116, street: "2010 Alameda Dr" )

    HMMC.db.create_school(name: 'Dr Bryan C Jack Elementary School', city: "Flint", state: "TX", zipcode: 75762, lat: 32.230457, long: -95.34982, street: "17199 FM 2493" )
    HMMC.db.create_school(name: 'Ridgetop Elementary School', city: "Tyler", state: "TX", zipcode: 75703, lat: 32.292854, long: -95.307076, street: "409 Carriage Dr" )
    HMMC.db.create_school(name: 'Owens Elementary School', city: "Tyler", state: "TX", zipcode: 75703, lat: 32.233906, long: -95.36472, street: "11780 C R 168" )
    HMMC.db.create_school(name: 'Ranch Academy - Tyler Campus', city: "Tyler", state: "TX", zipcode: 75703, lat: 32.277515, long: -95.36523, street: "14023 State Hwy 155 S" )
    HMMC.db.create_school(name: 'East Texas Christian Academy Elementary School', city: "Tyler", state: "TX", zipcode: 75707, lat: 32.27606, long: -95.269035, street: "2448 Roy Road" )
    HMMC.db.create_school(name: 'Cumberland Academy', city: "Tyler", state: "TX", zipcode: 78703, lat: 32.2953, long: -95.28692, street: "1340 Shiloh Rd" )

    HMMC.db.create_school(name: 'Robert E Lee High School', city: "Tyler", state: "TX", zipcode: 78701, lat: 32.30113, long: -95.29686, street: "411 Ese Loop 323" )
    HMMC.db.create_school(name: 'East Texas Christian Academy Middle School', city: "Tyler", state: "TX", zipcode: 78703, lat: 32.29527, long: -95.280304, street: "1797 Shiloh Road" )
    HMMC.db.create_school(name: 'Hubbard Middle School', city: "Tyler", state: "TX", zipcode: 78703, lat: 32.300053, long: -95.28736, street: "1405 East Southeast Loop 323" )
    HMMC.db.create_school(name: 'Bishop Tk Gorman Regional Catholic School', city: "Tyler", state: "TX", zipcode: 78701, lat: 32.305347, long: -95.28538, street: "1405 East Southeast Loop 323" )
    HMMC.db.create_school(name: 'Grace Community School - Elementary Campus', city: "Tyler", state: "TX", zipcode: 78701, lat: 32.314747, long: -95.315186, street: "3215 Old Jacksonville Road" )
    HMMC.db.create_school(name: 'Woods Elementary School', city: "Tyler", state: "TX", zipcode: 78701, lat: 32.3158, long: -95.28991, street: "3131 Fry Ave" )
    HMMC.db.create_school(name: 'All Saints Episcopal School', city: "Tyler", state: "TX", zipcode: 78709, lat: 32.319252, long: -95.34235, street: "2695 South Southwest Loop 323" )
    HMMC.db.create_school(name: 'Good Shepherd School', city: "Tyler", state: "TX", zipcode: 78701, lat: 32.322685, long: -95.3071, street: "2525 Old Jacksonville Rd" )
    HMMC.db.create_school(name: 'Travis Heights Elementary School', city: "Tyler", state: "TX", zipcode: 78703, lat: 32.2953, long: -95.28692, street: "1340 Shiloh Rd" )

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
