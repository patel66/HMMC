module HMMC
  class CreateSchool < UseCase
    def run(inputs)
      school_name = inputs[:name]
      school_street = inputs[:street]
      school_state = inputs[:state]
      school_city = inputs[:city]
      school = inputs[:school]

      return failure(:invalid_input_no_name) if school_name.empty?
      return failure(:invalid_input_no_name) if school_street.empty?
      return failure(:invalid_input_no_name) if school_state.empty?
      return failure(:invalid_input_no_name) if school_city.empty?

      school = HMMC.db.create_school(:name => school_name, :street => school_street, :city => school_city, :state => school_state)
      success(:school => school)
    end
  end
end
 # result = subject.run(:school_name => school.name, :street=> school.street, :state => school.state, :city => school.city)
# return failure(:can_not_add_more_then_100) if inputs[:milesclass] >= 100
