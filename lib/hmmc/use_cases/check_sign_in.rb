
module HMMC
  class CheckSignIn < UseCase
    def run(inputs)
      email = inputs[:email]
      password = inputs[:password]

      user = HMMC.db.get_user_by_sid(session_id)

      if user == nil
        return failure :user_not_found
      else
        return success
      end
    end
  end
end




