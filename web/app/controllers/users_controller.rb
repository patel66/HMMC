class UsersController < ApplicationController
  def new
      # user signs up to the site
  end

  def login
      # form for signing in, after user has account
       binding.pry

    # params
    result = HMMC::SignIn.run(:email => params[:user][:email], :password => [:user][:password])
    session_id = result.session_id
    session[:app_sid] = session_id
    # session[:school_id] = school.id
    # user = HMMC.db.get_user_by_sid(session_id)
    # school = grab the school
    redirect_to "schools/#{school.id}"
  end


  def logout

  end


end
