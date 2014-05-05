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
        # user.id = (@user_id_counter +=1)
        @users[attrs[:id]] = attrs
        User.new(:name => attrs[:name], :email => attrs[:email], :password => attrs[:password], :id => attrs[:id])
        # you are not saving it here,
      end

      def create_school(attrs)
        attrs[:id] = (@school_id_counter +=1)
        # school.id = (@school_id_counter +=1)
        @schools[attrs[:id]] = attrs
        School.new(attrs)
        # School.new(:name => attrs[:name], :address => attrs[:address], :miles => attrs[:miles], :user_id => attrs[:user_id], :city => attrs[:city], :state => attrs[:state], :street => attrs[:street])
      end

      def get_user(id)
        user = User.new(@users[id])
        user # not save, so how to get user name etc
      end

      # def update_user(user)
      #   attrs = @users[user.id]
      #   attrs.merge!(:name => user.name, :email => user.e)
      #   attrs[:name] = user.name
      #   attrs[:email] = user.email
      # end

      def get_school(id)
        # @school[attrs[:id]]
        school_attrs = @schools[id]
        school = School.new(school_attrs)
        school # not save, so how to get school name etc
        # School.new(:name => attrs[:name], :user_id => attrs[:user_id], :address => attrs[:address], :city => [:city], :state => attrs[:state], :street => [:street])
      end

      def create_classroom(attrs)
        attrs[:id] = (@classroom_id_counter += 1)
        #classroom.id = (@classroom_id_counter +=1)
        @classrooms[attrs[:id]] = attrs
        Classroom.new(attrs)
      end



      def get_classroom(id)
        classroom_attrs = @classrooms[id]
        classroom = Classroom.new(classroom_attrs)
        classroom
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
    end
  end
end







