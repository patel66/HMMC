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

      def update_school(attrs)
        ar_school = School.find(attrs[:id])
        ar_school.students = attrs[:students]
        ar_school.save
        HMMC::School.new(attrs)
      end

      def get_all_schools
        ar_schools = School.all
        ar_schools_to_entity = ar_schools.map{|school| HMMC::School.new(school.attributes)}
        ar_schools

         ar_schools_to_entity.each do |school|
           school.activitys = get_activities_for_school(school.id)
         end
      end

      def get_activities_for_school(sid)
        ar_activities = Activity.all
        ar_school_activities = ar_activities.where(:school_id => sid)
        ar_school_activities.map {|activity| HMMC::Activity.new(activity.attributes)}
      end


      # def get_all_schools
      #   all_schools = @schools.values

      #   school_list = all_schools.map {|school_attrs| School.new(school_attrs)}
      #   school_list.each do |school|
      #     school.activitys = get_activities_for_school(school.id)
      #   end

      #   school_list
      # end

      def get_school_from_user_id(userid)
        ar_school = School.find_by_user_id(userid)
        return nil if ar_school.nil?
        HMMC::School.new(ar_school.attributes)
      end
# map{|activity| activity.miles}.reduce(0,:+)
#       def get_national_ranking
#         schools = get_all_schools
#         schools
#       end

      def get_national_ranking
        schools = get_all_schools
        schools.sort_by {|school| -school.total_miles_school}
         schools
      end

      def get_state_ranking(state)
        schools = get_all_schools
        state_schools = schools.select{|school| school.state == state}
        state_schools.sort_by {|school| -school.total_miles_school}
        state_schools
      end

      def get_city_ranking(city)
        schools = get_all_schools
        city_school = schools.select{|school| school.city == city}
        city_school.sort_by {|school| -school.total_miles_school}
      end

    end
  end
end
