module HMMC
  class CheckSignIn < UseCase
    def run(session_id)
      user = HMMC.db.get_user_by_sid(session_id)

      if user == nil
        return failure :not_signed_in
      else
        return success
      end
    end
  end
end
