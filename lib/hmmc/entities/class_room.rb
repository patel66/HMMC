module HMMC
  class Classroom < Entity
    attr_accessor :id, :school_id, :name
    attr_reader :miles

    def initialize(attrs={})
      @miles ||= 0
      super(attrs)
    end

    def add_miles(miles)
      @miles += miles

    end

    def edit_miles(miles)
       @miles = miles
    end

  end
end
