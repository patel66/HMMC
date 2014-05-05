module HMMC
  module Databases
    class SQLiteDB
      def initialize
        ActiveRecord::Base.establish_connection(
          :adapter => 'sqlite3',
          :database => 'HMMC_test'
        )
      end


      def clear_everything
        User.destroy_all
        Classroom.destroy_all
        School.destroy_all
      end

      class User < ActiveRecord::Base
        belongs_to :school
      end

      class School < ActiveRecord::Base
        has_many :classrooms
      end

      class Classroom < ActiveRecord::Base
        belongs_to :school
      end

      def create_user(attrs)
        user = User.create(attrs)
        HMMC::User.new(user.attributes)
      end

      def create_school(attrs)
        school = School.create(attrs)
        HMMC::School.new(school.attributes)
      end

      def create_classroom(attrs)
        classroom = Classroom.create(attrs)
        HMMC::Classroom.new(classroom.attributes)
      end

      def get_school(id)
        school = School.find(id)
        HMMC::School.new(school.attributes)

      end

      def get_user(id)
        user = User.find(id)
        HMMC::User.new(user.attributes)
      end

      def get_classroom(id)
        classroom = Classroom.find(id)
        HMMC::Classroom.new(classroom.attributes)
      end
    end
  end
end
