class ClassroomsController < ApplicationController
  def new

  end

  def create
    puts params

    result = HMMC::CreateClassRoom.run(:name => params[:class][:name], :school_id => params[:school_id].to_i)
    HMMC::AddMilesClass.run(:school_id => params[:school_id].to_i, :classroom => result.classroom.id, :milesclass => params[:class][:miles].to_i)
    redirect_to "/schools/#{params[:school_id]}"
  end

end
