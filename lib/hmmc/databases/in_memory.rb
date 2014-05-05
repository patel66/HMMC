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
      end


      def create_user(attrs)
        user = User.new(:name => attrs[:name], :email=> attrs[:email], :password=> attrs[:password])
        user.id = (@user_id_counter +=1)
        @users[user.id] = user

      end

      def create_school(attrs)
        school = School.new(:name=>attrs[:name], :address=> attrs[:address], :miles => attrs[:miles], :user_id =>attrs[:user_id], :city=> attrs[:city], :state=> attrs[:state], :street=> attrs[:street])
        school.id = (@school_id_counter +=1)
        @schools[school.id] = school
      end

      def get_user(id)
        user = @users[id]
        user
      end

      def get_school(id, classroom: false)
        school = @schools[id]
        # if classroom
        #   school.classrooms = get_classrooms_by_school(school.id)
        # end
        school
      end

      def get_all_schools
        allschools = schools.values
      end

      # def get_classrooms_by_school(school_id)
      #   # get classrooms for school
      # end

      # def update_school(school)
      #   school.classrooms.each do |classroom|
      #     # if classoom does not exist, create it
      #   end
      # end

      def create_classroom(attrs)
        classroom = Classroom.new(:miles => attrs[:miles], :name => attrs[:name], :school_id => attrs[:school_id])
        classroom.id = (@classroom_id_counter +=1)

        # @schools[classroom.school_id]
        @classrooms[classroom.id] = classroom
      end

      def get_classroom(id)
        classroom = @classrooms[id]
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

    end
  end
end
