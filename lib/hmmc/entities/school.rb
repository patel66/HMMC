module HMMC

  class School < Entity
    attr_accessor :id, :user_id, :name, :address, :classrooms, :city, :state, :street, :goal, :miles, :activitys, :students, :zipcode, :lat, :long

    def initialize(attrs={})
      @classrooms = []
      @activitys = []
      @students ||= 0
      super(attrs)
    end

    # def index
    #   @students = Student.all.limit(10) #
    #   render :index
    # end


    def add_classroom(newclass)
      @classrooms << newclass
    end

    def add_activity(newactivity)
      @activitys << newactivity
    end

    def total_miles
      return 0 if @classrooms.empty?
      @classrooms.map {|classroom| classroom.miles}.reduce(0,:+)
    end

    def get_classrooms
      @classrooms.sort_by{|classroom| classroom.miles}.reverse
    end

    # def get_classroom(name)
    # end

    def total_miles_school
      return 0 if @activitys.empty?
      total_miles = @activitys.map{|activity| activity.miles}.reduce(0,:+)
      #@miles = total_miles
    end
  end
end

