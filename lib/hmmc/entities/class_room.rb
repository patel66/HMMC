module HMMC
  class ClassRoom < Entity
    attr_accessor :id, :school_id, :miles, :name

    def initialize(attrs={})
      @miles = 0
      super(attrs)
    end

    def add_miles(miles)
      @miles += miles


    end

    def edit_miles(miles)
       @miles = miles
    end

    # def miles
    #   @miles
    # end

    # def miles=(miles)         # recursive?
    #   self.miles = miles
    # end

    # class = Classroom.find_by_id(29) #@classroom
    # class.miles = 10
  end
end
