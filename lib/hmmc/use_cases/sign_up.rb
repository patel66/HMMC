module HMMC
  class SignUp < UseCase
    def run(inputs)

      #user info
      name = inputs[:name]
      email = inputs[:email]
      password = inputs[:password]


      #school info
      school_name = inputs[:school_name]
      school_street = inputs[:street]
      school_state = inputs[:state]
      school_city = inputs[:city]
      school_students = inputs[:students]

      check_if_email_taken = HMMC.db.get_user_by_email(email)
      return failure :invalid_name if name.empty?
      return failure :invalid_password if password.empty?
      return failure :email_already_in_use if check_if_email_taken != nil

      return failure(:invalid_input_no_name) if school_name.empty?
      return failure(:invalid_input_no_name) if school_street.empty?
      return failure(:invalid_input_no_name) if school_state.empty?
      return failure(:invalid_input_no_name) if school_city.empty?
      return failure(:invalid_input_no_name) if school_students == nil

      new_user = HMMC.db.create_user(:name=> name, :email=> email, :password => password)
      new_school = HMMC.db.create_school(:name => school_name, :street => school_street, :city => school_city, :state => school_state, :user_id => new_user.id)
      success(:user => new_user,:school => new_school)
    end
  end
end


  # school_name = inputs[:name]
  # school_street = inputs[:street]
  # school_state = inputs[:state]
  # school_city = inputs[:city]
  # school = inputs[:school]
  #  # validate
  # return failure(:invalid_input_no_name) if school_name.empty?
  # return failure(:invalid_input_no_name) if school_street.empty?
  # return failure(:invalid_input_no_name) if school_state.empty?
  # return failure(:invalid_input_no_name) if school_city.empty?

  # school = HMMC.db.create_school(:name => school_name, :street => school_street, :city => school_city, :state => school_state)
  # success(:school => school)
