module HMMC
  class SignIn < UseCase
    def run(inputs)

      user = HMMC.db.get_user_by_email(inputs[:email])
      return failure(:email_not_found) if user == nil
      return failure(:incorrect_password) if user.password != inputs[:password]
      session = HMMC.db.create_session(:user_id => user.id)

      success :session_id => session[:id], user: user
    end
  end
end

# def signin
# session_result = HMMC::SignIn(stuff)
# session_id = session_result.session_id
# session[:session_id] = session_id
# end

# def create_activity
# session_id = session[:session_id]
# user = HMMC::Database::InMemory.db.get_user_by_session(session_id)
# school = HMMC::Database::InMemory.db.get_school_by_user(user.id)
# # create_activity_result = HMMC::CreateActivity.run(school_id: school.id)
# create_activity_result = HMMC::CreateActivity.run(school_id: params[:school_id])
# end
