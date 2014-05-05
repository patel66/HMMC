module HMMC

  class School < Entity
    attr_accessor :id, :user_id, :name, :address, :classrooms, :city, :state, :street

    def initialize(attrs={})
      @classrooms = []
      super(attrs)
    end

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

