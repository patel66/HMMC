class SessionsController < ApplicationController
  def new
    #form to sign in, goes to create action
  end

  def create
    result = HMMC::SignIn.run(:email => params[:user][:email], :password => params[:user][:password])
    session_id = result.session_id
    session[:app_sid] = session_id
    user = HMMC.db.get_user_by_sid(session_id)
    @school = HMMC.db.get_school_from_user_id(user.id)

    redirect_to "/schools/#{@school.id}"
  end

  def destroy
    #button link in the nav bar to sign out will go to this action
    # binding.pry
    puts session[:app_sid]
    result = HMMC::SignOut.run(:session_key => session[:app_sid])
    session[:app_sid].clear
    # binding.pry
    if result.success?
      # success :deleted => true, :user => user
      @user = result.user
      flash[:notice] = "See you next time #{@user.name}, you have successfully signed out!"
      redirect_to root_path
    else
      @error = result.error
      redirect_to root_path
    end
  end

end
