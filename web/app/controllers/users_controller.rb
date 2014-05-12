class UsersController < ApplicationController
  def new
      # user signs up to the site
  end

  # def home
  # end

  def login

  end

  def userin
    # login has the form which direct to here
    # put SignIn.run usecase here. get the session id.
    # from session id get the user id.
    # above in login comments to here.
    # binding.pry
    result = HMMC::SignIn.run(:email => params[:user][:email], :password => params[:user][:password])
    session_id = result.session_id
    session[:app_sid] = session_id
    user = HMMC.db.get_user_by_sid(session_id)
    @school = HMMC.db.get_school_from_user_id(user.id)

    redirect_to "/schools/#{@school.id}"
  end

  def logout
    binding.pry
    puts session[:app_sid]
    result = HMMC::SignOut.run(:session_key => session[:app_sid])
    if result.success?
      # success :deleted => true, :user => user
      @user = result.user
      flash[:notice] = "See you next time #{@user.name}, you have successfully signed out!"
      render 'users/new'
    else
      # @error = result.error
      # render 'new'
    end

  end

 # if signedup.success?
 #      @school = signedup.school
 #      @user = signedup.user
 #      # redirect_to "/schools/#{@school.id}"
 #      flash[:notice] = "Hello #{@user.name} you have successfully signed up"

 #      # button school landing pg
 #      render 'users/new'
 #    else
 #      @error = signedup.error
 #      render 'new'
 #    end

end
# class SignOut < UseCase
#     def run(inputs)
#       user = HMMC.db.get_user_by_sid(inputs[:session_key])
#       return failure(:session_not_found) if user.nil?

#       HMMC.db.delete_session(inputs[:session_key])

#       success :deleted => true

#     end
#   end
