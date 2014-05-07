module HMMC
  class SignOut < UseCase
    def run(session_id)
      user = HMMC.db.get_user_by_sid(session_id)
      if user == nil
        return failure(:session_not_found)
      else
        HMMC.db.delete_session(session_id)
        return success :deleted => true
      end
    end
  end
end