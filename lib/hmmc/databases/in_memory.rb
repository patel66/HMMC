module HMMC
  module Databases
    class InMemory

      def initialize(config=nil)
        # binding.pry
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
        @activities[attrs[:id]] = attrs
        Activity.new(attrs)
      end

      def create_user(attrs)
        password = attrs.delete(:password)
        password_digest = BCrypt::Password.create(password)
        attrs[:password_digest] = password_digest

        attrs[:id] = (@user_id_counter +=1)
        @users[attrs[:id]] = attrs
        User.new(:name => attrs[:name], :email => attrs[:email], :password => attrs[:password_digest], :id => attrs[:id])
      end

      def get_activity(id)
        activity_attrs = @activities[id]
        Activity.new(activity_attrs)
      end

      def create_school(attrs)
        attrs[:id] = (@school_id_counter +=1)

        @schools[attrs[:id]] = attrs
        School.new(attrs)

      end

      def get_user(id)
        user = User.new(@users[id])
        user
      end

      # TO DO: needs test
      def update_school(attrs)
        attrs = Hash[attrs.map{ |k, v| [k.to_sym, v] }]
        id = attrs[:id]
        school_attrs = @schools[id]
        school_attrs.merge!(attrs)
        School.new(school_attrs)
      end


      def get_school(id)
        school_attrs = @schools[id]
        return nil if school_attrs.nil?
        school = School.new(school_attrs)
        school.activitys = get_activities_for_school(id)
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

        school_list = all_schools.map {|school_attrs| School.new(school_attrs)}
        school_list = school_list.select {|school| school.user_id.nil? == false}
        school_list.each do |school|
          school.activitys = get_activities_for_school(school.id)
        end

        school_list
      end

      def get_all_users
        all_users = @users.values
        all_users
      end

      def create_classroom(attrs)
        # combine with school_update, for adding classe
        # to school, and school_id validation
      end

      def get_national_ranking
        schools = get_all_schools
        schools.sort_by {|school| -school.total_miles_school}
        return schools
      end

      def get_state_ranking(state)
        schools = get_all_schools
        st_schools = schools.select {|school| school.state == state}
        st_schools.sort_by {|school| -school.total_miles_school}
        return st_schools
      end

      def get_city_ranking(city)
        schools = get_all_schools
        s = schools.select {|school| school.city == city}
        s.sort_by {|school| -school.total_miles_school}
        return s
      end

      def create_classroom(attrs)
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
        @sessions[sid]= { session_key: sid, user_id: attrs[:user_id]}
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

      def get_user_by_email(email)
        user = @users.values.select{|attributes| attributes[:email] == email}
        user_attr = user[0]
        return nil if user_attr.nil?
        retrieved_user = User.new(user_attr)
      end

      def get_school_from_user_id(userid)
        school = @schools.values.select{|attributes| attributes[:user_id] == userid}
        school_attr = school[0]
        return nil if school_attr.nil?
        retreived_user = School.new(school_attr)
      end

      def get_all_schools_sign_up
        ar_schools = School.all

        ar_schools_to_entity = ar_schools.map {|school| HMMC::School.new(school.attributes)}
        # ar_schools
        schools_we_want = ar_schools_to_entity.select {|school| school.user_id.nil? == false}
        schools_we_want.each do |school|
         school.activitys = get_activities_for_school(school.id)
        end
      end

    end
  end
end
