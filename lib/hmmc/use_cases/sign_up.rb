module HMMC
  class SignUp < UseCase
    def run(inputs)
      name = inputs[:name]
      email = inputs[:email]
      password = inputs[:password]

      check_if_email_taken = HMMC.db.get_user_by_email(email)
      return failure :invalid_name if name.empty?
      return failure :email_already_in_use if check_if_email_taken != nil
      new_user = HMMC.db.create_user(:name=> name, :email=> email, :password => password)
      session = HMMC.db.create_session(:user_id => new_user.id)
      success(:user => new_user, :session => session )
    end



  end
end


# user = HMMC.db.get_user(data[:email])
#       if user != nil
#         return failure :email_taken
#       else
#         user = HMMC.user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
#         session = HMMC.db.create_session(user.id)
#         return success :session_id => session.id
#       end


# controller

# def SignUp
## SignUp
#    SignUp()   //
#    CreateSchool()
#    view sign in

# # end

#   SignOut
