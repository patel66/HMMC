require 'pry-debugger'

module HMMC
  def self.db
    @__db_instance ||= Databases::InMemory.new
  end
end

require_relative "hmmc/use_case.rb"
Dir[File.dirname(__FILE__) + '/use_cases/*.rb'].each {|file| require_relative file }
Dir[File.dirname(__FILE__) + '/entities/*.rb'].each {|file| require_relative file }
Dir[File.dirname(__FILE__) + '/databases/*.rb'].each {|file| require_relative file }

require_relative "hmmc/entity.rb"
require_relative "hmmc/databases/in_memory.rb"
require_relative "hmmc/entities/user.rb"
require_relative "hmmc/entities/school.rb"
require_relative "hmmc/entities/class.rb"
