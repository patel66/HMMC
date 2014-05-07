module HMMC
  class SignIn < UseCase
    def run(inputs)

      user = HMMC.db.get_user_by_email(inputs[:email])
      return failure(:email_not_found) if user == nil
      return failure(:incorrect_password) if user.password != inputs[:password]
      session = HMMC.db.create_session(:user_id => user.id)

      success :session_id => session[:id]
    end
  end
end
