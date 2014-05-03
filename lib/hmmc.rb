require 'pry-debugger'

module HMMC
end

require_relative "use_case.rb"
Dir[File.dirname(__FILE__) + '/use_case/*.rb'].each {|file| require_relative file }
Dir[File.dirname(__FILE__) + '/entities/*.rb'].each {|file| require_relative file }
Dir[File.dirname(__FILE__) + '/database/*.rb'].each {|file| require_relative file }

