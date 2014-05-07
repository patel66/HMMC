module HMMC
  class SignOut < UseCase
    def run(inputs)
      user = HMMC.db.get_user_by_sid(inputs[:session_key])
      return failure(:session_not_found) if user.nil?

      HMMC.db.delete_session(inputs[:session_key])

      success :deleted => true

    end
  end
end
