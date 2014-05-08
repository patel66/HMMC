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

    result = HMMC::CreateSchool.run(school_params)
    @school = result.school
    # /schools/:id(.:format)
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
   # result = RabbitDice::CreateGame.run(players: params[:players])
   #  error = result.error
   #  @game = result.game
   #  # render :json => {"example" => "response"}
   #  # respond_to do |format|
   #  #   format.html
   #  #   format.json {render :json => @game}
   #  # end

   #  redirect_to "/games/#{@game.id}"
