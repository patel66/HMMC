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
  end
end
