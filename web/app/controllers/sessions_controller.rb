class SessionsController < ApplicationController
  def new
    #form to sign in, goes to create action
  end

  def create

    result = HMMC::SignIn.run(:email => params[:user][:email], :password => params[:user][:password])
    if result.success?
      session_id = result.session_id
      session[:app_sid] = session_id
      user = HMMC.db.get_user_by_sid(session_id)
      @school = HMMC.db.get_school_from_user_id(user.id)
      redirect_to "/schools/#{@school.id}"
    else
      flash[:error] = result.error
      redirect_to "/"
    end
  end

  def destroy

    puts session[:app_sid]
    result = HMMC::SignOut.run(:session_key => session[:app_sid])
    session[:app_sid].clear

    session[:app_sid].clear
    if result.success?

      @user = result.user
      flash[:notice] = "See you next time #{@user.name}, you have successfully signed out!"
      redirect_to root_path
    else
      @error = result.error
      redirect_to root_path
    end
  end

end
