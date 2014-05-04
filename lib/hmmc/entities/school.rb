module HMMC

  class School < Entity
    attr_accessor :id, :user_id, :name, :address, :total_miles, :miles, :classrooms

    def initialize(attrs={})
      @classrooms = []
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
  end
end
