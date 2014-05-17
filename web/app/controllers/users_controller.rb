class UsersController < ApplicationController
  # layout 'home'
  def new
      # user signs up to the site
  end

  def admin
    # verify session to check if user is admin
    # want to give the view access to variables
    # current_user = grab the user from the session

    # if current_user.admin
      # @schools = HMMC.db.get_all_schools
      # write db method to get by state, to get by city

      #give whatever instance variables the view needs
    # else
      #redirect user to a different page - so they can't use the admin page
      # redirect_to root_path
    # end
  end

end

