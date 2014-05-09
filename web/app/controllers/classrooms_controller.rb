class ClassroomsController < ApplicationController
  def new

  end

  def create
    puts params

    success(:activity => activity, :school => school)

    result = HMMC::CreateClassRoom.run(:name => params[:class][:name], :school_id => params[:school_id].to_i)
    HMMC::AddMilesClass.run(:school_id => params[:school_id].to_i, :classroom => result.classroom.id, :milesclass => params[:class][:miles].to_i)
    @school = result.school

    redirect_to "/schools/#{@school.id}"
  end

end



