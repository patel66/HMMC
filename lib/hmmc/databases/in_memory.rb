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
        @users = {}
        @schools = {}
        @classrooms = {}
        @student_rankings = {}
        @sessions = {}
      end


      def create_user(attrs)
        attrs[:id] = (@user_id_counter +=1)

        @users[attrs[:id]] = attrs
        User.new(:name => attrs[:name], :email => attrs[:email], :password => attrs[:password], :id => attrs[:id])

      end

      def create_school(attrs)
        attrs[:id] = (@school_id_counter +=1)

        @schools[attrs[:id]] = attrs
        School.new(attrs)

      end

      def get_user(id)
        user = User.new(@users[id])
        user # not save, so how to get user name etc
      end



      def get_school(id)
        school_attrs = @schools[id]
        return nil if school_attrs.nil?

        school = School.new(school_attrs)
        school.classrooms = get_classrooms_for_school(id)
        school
      end

      def get_classrooms_for_school(sid)
        school_classrooms = @classrooms.values.select { |classroom_attrs| classroom_attrs[:school_id] == sid }
        school_classrooms.map { |attrs| Classroom.new(attrs) }
      end

      # @classrooms = {
      #   1 => {
      #     school_id: 1,
      #     name: 'Kempner'
      #   }
      # }

      def get_all_schools
        allschools = schools.values
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
        @sessions.delete[sid]
      end


      def update_classroom_miles(attrs)
        retreived_classroom = get_classroom(attrs[:classroom_id])
        retreived_classroom.miles = attrs[:miles]
        retreived_classroom
      end

      def get_user_by_sid(sid)
        session = @sessions[sid]
        uid = session[user_id]
        user = get_user(uid)

      end
    end
  end
end
