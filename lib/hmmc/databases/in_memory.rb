module HMMC
  module Databases
    class InMemory

      def initialize(config=nil)

        clear_everything
      end


      def clear_everything
        @user_id_counter = 0
        @school_id_counter = 0
        @classroom_id_counter = 0
        @student_rank_id_counter = 0
        @activity_id_counter = 0
        @users = {}
        @schools = {}
        @classrooms = {}
        @student_rankings = {}
        @sessions = {}
        @activities = {}
      end

      def create_activity(attrs)
        attrs[:id] = (@activity_id_counter +=1)
        @activities[:id] = attrs
        Activity.new(attrs)
      end

      def create_user(attrs)
        attrs[:id] = (@user_id_counter +=1)
        @users[attrs[:id]] = attrs
        User.new(:name => attrs[:name], :email => attrs[:email], :password => attrs[:password], :id => attrs[:id])
      end

      def get_activity(id)
        activity_attrs = @activities[:id]
        Activity.new(activity_attrs)
      end

      def create_school(attrs)
        attrs[:id] = (@school_id_counter +=1)

        @schools[attrs[:id]] = attrs
        School.new(attrs)

      end

      def get_user(id)
        user = User.new(@users[id])
        # user.school = get_school_by_user(user_id)
        user # not save, so how to get user name etc
      end

      # TO DO: needs test
      def update_school(attrs)
        attrs = Hash[attrs.map{ |k, v| [k.to_sym, v] }]
        # binding.pry

        id = attrs[:id]
        school_attrs = @schools[id]
        school_attrs.merge!(attrs)
        School.new(school_attrs)
      end


      def get_school(id)
        school_attrs = @schools[id]
        return nil if school_attrs.nil?

        school = School.new(school_attrs)
        # school.activitys = get_activities_for_school(id)
        school.classrooms = get_classrooms_for_school(id)
        school
      end

      def get_classrooms_for_school(sid)
        school_classrooms = @classrooms.values.select { |classroom_attrs| classroom_attrs[:school_id] == sid }
        school_classrooms.map { |attrs| Classroom.new(attrs) }
      end

      def get_activities_for_school(sid)
        school_classrooms = @activities.values.select { |classroom_attrs| classroom_attrs[:school_id] == sid }
        school_classrooms.map { |attrs| Activity.new(attrs) }
      end


      def get_all_schools
        all_schools = @schools.values
        all_schools
      end

      def create_classroom(attrs)
        # combine with school_update, for adding classe
        # to school, and school_id validation

        attrs[:id] = (@classroom_id_counter += 1)

        @classrooms[attrs[:id]] = attrs
        Classroom.new(attrs)
      end

      def get_classroom(id)
        classroom_attrs = @classrooms[id]
        classroom = Classroom.new(classroom_attrs)
        classroom
      end

      def get_all_classrooms
      end

      def create_ranking(attrs)
        student_rank = StudentRanking.new(:school_id => attrs[:school_id], :students=> attrs[:students])
        student_rank.id = (@student_rank_id_counter +=1)
        @student_rankings[student_rank.id] = student_rank
      end

      def get_rank(id)
        student_rank = @student_rankings[id]
        student_rank
      end

      def create_session(attrs)

        sid = SecureRandom.uuid
        @sessions[sid]= { id: sid, user_id: attrs[:user_id]}
      end

      def get_session(sid)
        @sessions[sid]
      end

      def delete_session(sid)
        @sessions.delete(sid)
      end


      def update_classroom(attrs)
        id = attrs[:classroom_id]
        classroom_attrs = @classrooms[id]
        classroom_attrs.merge!(attrs)
        Classroom.new(classroom_attrs)
      end

      # gets a the currently signed in by the session id
      def get_user_by_sid(sid)
        session_attrs = @sessions[sid]
        return nil if session_attrs.nil?
        uid = session_attrs[:user_id]
        user = get_user(uid)

      end

      def get_class_by_name(name)
        c_room = @classrooms.values.select{|attributes| attributes[:name] == name}

        classroom = Classroom.new(c_room[0])
        classroom
      end
# {1=>{:school_id=>1, :miles=>0, :name=>"Math", :id=>1}, 2=>{:school_id=>1, :miles=>0, :name=>"English", :id=>2}, 3=>{:school_id=>1, :miles=>0, :name=>"History", :id=>3}}

      def get_user_by_email(email)
        user = @users.values.select{|attributes| attributes[:email] == email}
        user_attr = user[0]
        return nil if user_attr.nil?
        retrieved_user = User.new(user_attr)
      end


      def get_school_from_user_id(userid)
        # binding.pry
        school = @schools.values.select{|attributes| attributes[:user_id] == userid}
        school_attr = school[0]
        return nil if school_attr.nil?

        retreived_user = School.new(school_attr)
      end

    end
  end
end
