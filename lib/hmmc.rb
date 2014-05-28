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

    HMMC.db.create_school(name: 'Watterson-Lake School', city: "Cleveland", state: "OH", zipcode: 44102, lat: 41.48147, long: -81.73625, street: "1422 West 74th St" )
    HMMC.db.create_school(name: 'Joseph M Gallagher School', city: "Cleveland", state: "OH", zipcode: 44102, lat: 41.480988, long: -81.73173, street: "6601 Franklin Blvd" )
    HMMC.db.create_school(name: 'Luther Memorial Elementary School', city: "Cleveland", state: "OH", zipcode: 44102, lat: 41.473827, long: -81.74402, street: "8607 Sauer Ave" )

    HMMC.db.create_school(name: 'Susan Miller Dorsey Senior High School', city: "Los Angeles", state: "CA", zipcode: 90016, lat: 34.02296, long: -118.3478, street: "3537 Farmdale Avenue" )
    HMMC.db.create_school(name: 'Cienega Elementary School', city: "Los Angeles", state: "CA", zipcode: 90016, lat: 34.032394, long: -118.35393, street: "2611 South Orange Drive" )
    HMMC.db.create_school(name: 'Little Lamb-Lamb of God Christian School', city: "Los Angeles", state: "CA", zipcode: 90016, lat: 34.019184, long: -118.35609, street: "3717 South La Brea Avenue" )

    HMMC.db.create_school(name: 'International Studies Academy', city: "San Francisco", state: "CA", zipcode: 94107, lat: 37.76169, long: -122.400665, street: "655 De Haro Street" )
    HMMC.db.create_school(name: 'Live Oak School', city: "San Francisco", state: "CA", zipcode: 94107, lat: 37.76354, long: -122.39906, street: "1555 Mariposa Street" )
    HMMC.db.create_school(name: 'KIPP San Francisco College Preparatory', city: "San Francisco", state: "CA", zipcode: 94107, lat: 37.761875, long: -122.40112, street: "655 De Haro Street" )

    HMMC.db.create_school(name: 'Plainfield Elementary School', city: "Des Plaines", state: "IL", zipcode: 60018, lat: 42.019043, long: -87.90232, street: "1850 Plainfield Drive")
    HMMC.db.create_school(name: 'Maine West High School', city: "Des Plaines", state: "IL", zipcode: 60018, lat: 42.021496, long: -87.906906, street: "1755 South Wolf Road" )
    HMMC.db.create_school(name: 'South Elementary School', city: "Des Plaines", state: "IL", zipcode: 60018, lat: 42.020138, long: -87.88577, street: "1535 Everett Avenue" )

    HMMC.db.create_school(name: 'Crossan Kennedy C School', city: "Philadelphia", state: "PA", zipcode: 19111, lat: 40.062153, long: -75.081184, street: "7350 Bingham St")
    HMMC.db.create_school(name: 'Northeast High School', city: "Philadelphia", state: "PA", zipcode: 19111, lat: 40.055916, long: -75.07096, street: "1601 Cottman Ave" )
    HMMC.db.create_school(name: 'Northeast Preparatory School', city: "Philadelphia", state: "PA", zipcode: 19111, lat: 40.0583, long: -75.0784, street: "1309 Cottman Ave" )

    HMMC.db.create_school(name: 'W A Blair Elementary School', city: "Dallas", state: "TX", zipcode: 75217, lat: 32.709064, long: -96.689255, street: "7720 Gayglen Dr")
    HMMC.db.create_school(name: 'B H Macon Elementary School', city: "Dallas", state: "TX", zipcode: 75217, lat: 32.72278, long: -96.673256, street: "650 Holcomb Rd" )
    HMMC.db.create_school(name: 'Julius Dorsey Elementary School', city: "Dallas", state: "TX", zipcode: 75217, lat: 32.713078, long: -96.657425, street: "133 N St Augustine Dr" )

    HMMC.db.create_school(name: 'W A Blair Elementary School', city: "San Jose", state: "CA", zipcode: 95111, lat: 37.286507, long: -121.83162, street: "455 Los Arboles Avenue")
    HMMC.db.create_school(name: 'Daniel Lairon Elementary School', city: "San Jose", state: "CA", zipcode: 95111, lat: 37.282227, long: -121.83007, street: "3975 Mira Loma" )
    HMMC.db.create_school(name: 'Sylvandale Middle School', city: "San Jose", state: "CA", zipcode: 95111, lat: 37.289005, long: -121.82406, street: "653 Sylvandale Avenue" )

    HMMC.db.create_school(name: 'Lake Shore Middle School', city: "Jacksonville", state: "FL", zipcode: 32210, lat: 30.273252, long: -81.72369, street: "2519 Bayview Rd")
    HMMC.db.create_school(name: 'Bayview Elementary School', city: "Jacksonville", state: "FL", zipcode: 32210, lat: 30.271767, long: -81.72338, street: "3257 Lake Shore Blvd" )
    HMMC.db.create_school(name: 'Chosen Vessels', city: "Jacksonville", state: "FL", zipcode: 32210, lat: 30.284525, long: -81.7228, street: "4541 Shirley Avenue #3" )

    HMMC.db.create_school(name: 'Lake Shore Middle School', city: "Detroit", state: "MI", zipcode: 48228, lat: 42.36041, long: -83.220436, street: "18445 Cathedral St")
    HMMC.db.create_school(name: 'Detroit Premier Academy', city: "Detroit", state: "MI", zipcode: 48228, lat: 42.349556, long: -83.20627, street: "7781 Asbury Park" )
    HMMC.db.create_school(name: 'St. Christopher', city: "Detroit", state: "MI", zipcode: 48228, lat: 42.35, long: -83.2072, street: "7800 Woodmont Ave" )


    # HMMC.db.create_school(name: 'McKay K-8 School', city: "East Boston", state: "MA", zipcode: 02128, lat: 42.369186, long: -71.03424, street: "122 Cottage St")
    # HMMC.db.create_school(name: 'Adams Elementary School', city: "East Boston", state: "MA", zipcode: 02128, lat: 42.365513, long: -71.0349, street: "165 Webster St" )
    # HMMC.db.create_school(name: 'Savio Preparatory High School', city: "East Boston", state: "MA", zipcode: 02128, lat: 42.3831, long: -71.01605, street: "145 Byron Street" )


    HMMC.db.create_school(name: 'Keller Elementary School', city: "Colorado Springs", state: "CO", zipcode: 80918, lat: 38.906055, long: -104.75816, street: "3730 Montbello Dr")
    HMMC.db.create_school(name: 'Russell Middle School', city: "Colorado Springs", state: "CO", zipcode: 80918, lat: 38.90365, long: -104.75781, street: "3825 Montbello Dr" )
    HMMC.db.create_school(name: 'Doherty High School', city: "Colorado Springs", state: "CO", zipcode: 80918, lat: 38.895973, long: -104.74386, street: "4515 Barnes Rd" )

    HMMC.db.create_school(name: 'Brandon Middle School', city: "Virginia Beach", state: "VA", zipcode: 23464, lat: 36.793003, long: -76.19264, street: "1700 Pope St")
    HMMC.db.create_school(name: 'Tallwood Elementary School', city: "Virginia Beach", state: "VA", zipcode: 23464, lat: 36.77922, long: -76.19817, street: "2025 Kempsville Rd" )
    HMMC.db.create_school(name: 'Woodstock Elementary School', city: "Virginia Beach", state: "VA", zipcode: 23464, lat: 36.81435, long: -76.201584, street: "6016 Providence Rd" )

    HMMC.db.create_school(name: 'Remington Elementary School', city: "Tulsa", state: "OK", zipcode: 74107, lat: 36.085064, long: -96.02132, street: "2524 West 53 St")
    HMMC.db.create_school(name: 'Jenks West Elementary School', city: "Tulsa", state: "OK", zipcode: 74107, lat: 36.03083, long: -96.005745, street: "2550 West K Place" )
    HMMC.db.create_school(name: 'Marshall Elementary School', city: "Tulsa", state: "OK", zipcode: 74107, lat: 36.08241, long: -95.9775, street: "1142 East 56th St" )





  end

  # def genUniqueEmail
  #   @@@idcounter ||= 0
  #   @@@idcounter = @@@idcounter + 1
  #   thatEmail = "john#{@@@idcounter}@gmail.com"
  #   return thatEmail

  # end

  # def registerUsers(selected_school)
  #   HMMC.db.SignUp.run(
  #       :name => "John",
  #       :email => genUniqueEmail,
  #       :password => "123456",
  #       :school_name => selected_school[0],
  #       :street => selected_school[0].street,
  #       :city => selected_school[0].city,
  #       :state=>selected_school[0].state,
  #       :students=> 500,
  #       :lat => selected_school[0].lat,
  #       :long => selected_school[0].long
  #   )
  # end

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
