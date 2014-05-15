class SchoolsController < ApplicationController
  layout "application"
  def new
    # @school = HMMC::School.new
  end

  def create
    user_params = params[:user]
    school_params = params[:school]

    signedup = HMMC::SignUp.run(
      :name => user_params[:name],
      :email => user_params[:email],
      :password=> user_params[:password],
      :school_name => school_params[:name],
      :street => school_params[:street],
      :city => school_params[:city],
      :state=>school_params[:state],
      :students=> school_params[:students]
      )

    if signedup.success?
      @school = signedup.school
      @user = signedup.user
      # redirect_to "/schools/#{@school.id}"
      flash[:notice] = "Hello #{@user.name} you have successfully signed up"

      # button school landing pg
      render 'users/new'
    else
      @error = signedup.error
      render 'new'
    end

  end


  def show
    # sign in will go here
    flash[:error]
    params
    # binding.pry
    @school = HMMC.db.get_school(params[:id].to_i)
    @user = HMMC.db.get_user_by_sid(session[:app_sid])
    if @user != nil
     @users_school = HMMC.db.get_school_from_user_id(@user.id)
    end


  end

  def edit

  end

  def update

    binding.pry
    @school = HMMC.db.update_school(:id => params[:id].to_i, :students => params[:school][:students].to_i)
    redirect_to "/schools/#{@school.id}"
  end

  def leaderboard

     render :layout => 'home'
  end

  private
  def school_params
    params.require(:school).permit(:name, :state, :street, :city)
  end


end




