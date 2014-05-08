
module HMMC
  class CheckSignIn < UseCase
    def run(inputs)
      email = inputs[:email]
      password = inputs[:password]

      user = HMMC.db.get_user_by_sid(inputs[:session_key])
      return failure :user_not_found if user == nil
      
      return success
    end
  end
end




