module HMMC
  module Databases
    class InMemory

      def initialize
        @user_id_counter = 0
        @school_id_counter = 0
        @users = {}
        @schools = {}
      end

      def create_user(attrs)
        # attr_accessor :id, :school, :name, :email, :password
        user = User.new(:name => attrs[:name], :email=> attrs[:email], :password=> attrs[:password])
        user.id = (@user_id_counter +=1)
        @users[user.id] = user

      end

      def create_school(attrs)
        school = School.new(:name=>attrs[:name], :address=> attrs[:address], :miles => attrs[:miles])
        school.id = (@school_id_counter +=1)
        @schools[school.id] = school
      end

      def get_user(id)
        user = @users[id]
        user
      end

      def get_school(id)
        school = @schools[id]
        school
      end

    end
  end
end


