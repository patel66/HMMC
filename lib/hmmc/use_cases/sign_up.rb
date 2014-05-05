module HMMC
  class SignUp < UseCase
    def run(data)
      user = HMMC.db.get_user(data[:email])
      if user != nil
        return failure :email_taken
      else
        user = HMMC.user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
        session = HMMC.db.create_session(user.id)
        return success :session_id => session.id
      end
    end
  end
end
