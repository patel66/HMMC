module HMMC
  class StudentRanking < Entity
    attr_accessor :id, :school_id, :students

    def initialize(attrs={})
      @students = {}
      super(attrs)
    end

    def add_student(name,miles)
      @students[name] = miles
    end
  end
end
