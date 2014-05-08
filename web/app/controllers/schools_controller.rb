class SchoolsController < ApplicationController
  layout "signed_in"
  def new
    @school = HMMC::School.new
  end

  def create
    name = params[:name]
    params[:state]
    params[:city]
    params[:street]

    # result = HMMC::CreateSchool.run(school_params)
    # @school = result.school
    # # /schools/:id(.:format)
    # redirect_to "/schools/#{@school.id}"

    user_params = params[:user]
    school_params = params[:school]

    result = HMMC::SignUp.run(
      :name => user_params[:name],
      :email => user_params[:email],
      :password=> user_params[:password],
      :school_name => school_params[:name],
      :street => school_params[:street],
      :city => school_params[:city],
      :state=>school_params[:state],
      :students=> school_params[:students]
      )

    @school = result.school
    @session = result.session_id

    redirect_to "/schools/#{@school.id}"


  end


  def show
    @school = HMMC.db.get_school(params[:id].to_i)
  end

  private
  def school_params
    params.require(:school).permit(:name, :state, :street, :city)
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


   # result = RabbitDice::CreateGame.run(players: params[:players])
   #  error = result.error
   #  @game = result.game
   #  # render :json => {"example" => "response"}
   #  # respond_to do |format|
   #  #   format.html
   #  #   format.json {render :json => @game}
   #  # end

   #  redirect_to "/games/#{@game.id}"
