module HMMC

  class School < Entity
                        #do i need this? user
    attr_accessor :id, :user_id, :name, :address, :classrooms

    def initialize(attrs={})
      @classrooms = []
      # @total_miles = 0
      super(attrs)
    end


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

    # def add_miles(miles)
    #   @total_miles += miles

    # end


    def total_miles
      return 0 if @classrooms.empty?

      @classrooms.map {|classroom| classroom.miles}.reduce(0,:+)

    end


  #   @school = School.find_by_id(1)

  #   @school.total_miles # 0

  #   Classroom.create({id: 1, school_id: 1, name: 'math', miles: 20})

  #   @school.total_miles #20

  #   Classroom.create({id: 2, school_id: 1, name: 'math 2', miles: 10})

  #   @school.total_miles #30

  #   name,       id, school_id
  #   mathmatics, 15, 1,
  end
end
