module HMMC
  module Databases
    class SQLiteDB
      def initialize
        ActiveRecord::Base.establish_connection(
          :adapter => 'sqlite3',
          :database => 'HMMC_test'
        )
      end
    end
  end
end
