module HMMC

  class School < Entity
                        #do i need this? user
    attr_accessor :id, :user_id, :name, :address, :classrooms, :city, :state, :street

    def initialize(attrs={})
      @classrooms = []
      # @total_miles = 0
      super(attrs)
    end
<<<<<<< HEAD
  
=======

>>>>>>> 6e66491b888c650988892596dc7963fdf49c7433


    # def initialize(data)
    # 	@id = data[:id]
    # 	@user_id = data[:user_id]
    # 	@name = data[:name]
    # 	@address = data[:address]
    # 	@miles = data[:miles]
    # 	@total_miles = data[:total_miles]
    # end

    # coach is going to input # miles per classroom
    # every friday the coach is going to choose the top 10 students who exercised the most
    #

    # def index
    #   @students = Student.all.limit(10) #
    #   render :index
    # end

    def add_classroom(newclass)
      @classrooms << newclass
    end

    def total_miles
      return 0 if @classrooms.empty?

      @classrooms.map {|classroom| classroom.miles}.reduce(0,:+)

    end

    def get_classrooms
      @classrooms.sort_by{|classroom| classroom.miles}.reverse
    end
  end
end

