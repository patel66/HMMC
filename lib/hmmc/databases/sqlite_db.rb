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
        has_many :activities
      end

      class Classroom < ActiveRecord::Base
        belongs_to :school
      end

      class Activity < ActiveRecord::Base
        belongs_to :school
      end

      def create_user(attrs)
        ar_user = User.create(attrs)
        HMMC::User.new(ar_user.attributes)
      end

      def create_activity(attrs)
        ar_activity = Activity.create(attrs)
        HMMC::Activity.new(ar_activity.attributes)
      end

      def create_school(attrs)

        ar_school = School.create(attrs)
        HMMC::School.new(ar_school.attributes)
      end

      def create_classroom(attrs)
        ar_classroom = Classroom.create(attrs)
        HMMC::Classroom.new(ar_classroom.attributes)
      end

      def get_school(id)
        ar_school = School.find(id)
        HMMC::School.new(ar_school.attributes)
      end

      def get_activity(id)
        ar_activity = Activity.find(id)
        HMMC::Activity.new(ar_activity.attributes)
      end

      def get_user(id)
        ar_user = User.find(id)
        HMMC::User.new(ar_user.attributes)
      end

      def get_classroom(id)
        ar_classroom = Classroom.find(id)
        HMMC::Classroom.new(ar_classroom.attributes)
      end

      def update_classroom(attrs)

        # binding.pry

        ar_classroom = Classroom.find(attrs[:classroom_id])
        ar_classroom.miles = attrs[:miles]
        ar_classroom.save
        HMMC::Classroom.new(attrs)
      end

      def get_class_by_name(name)
        # @classrooms.values.find { |classroom_attrs| classroom_attrs[:name] == name }
        ar_classroom = Classroom.find_by_name(name)
        HMMC::Classroom.new(ar_classroom.attributes)
      end

      def get_user_by_email(email)
        ar_user = User.find_by_email(email)
        HMMC::User.new(ar_user.attributes)
      end
    end
  end
end
