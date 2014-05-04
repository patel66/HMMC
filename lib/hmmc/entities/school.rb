module HMMC

  class School < Entity
    attr_accessor :id, :user_id, :name, :address, :total_miles, :miles, :classrooms

    def initialize(attrs={})
      @classrooms = []
      @total_miles = 0
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


    def add_classroom(newclass)
      @classrooms << newclass
    end

    def add_miles(miles)
      @total_miles += miles
    end

    def add_total_miles
      miles_all_class = @classrooms.map {|classroom| classroom.miles}.reduce(0,:+)
        # array.map {|num| num}.reduce(0,:+)
      @total_miles += miles_all_class
      @total_miles

    end

  end
end
