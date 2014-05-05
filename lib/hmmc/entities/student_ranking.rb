module HMMC
  class StudentRanking < Entity
    attr_accessor :id, :school_id, :students

    def initialize(attrs={})
      @students = {}
      super(attrs)
    end
    # def initialize(attrs)
    #   students[attrs] = 0
    # end
    # def students
    #   miles = 0
    # end

    # def add_miles(studentname,miles)

    # end

    def add_student(name,miles)
      @students[name] = miles
    end
  end
end
# studenranking, id, :school_id
# students is a hash with studentname => integer of miles
