class ActivitiesController < ApplicationController
  def new

  end

  def create
    result = HMMC::CreateActivity.run(:miles => params[:activity][:miles].to_i, :students => params[:activity][:students], :date => params[:date], :school_id => params[:school_id].to_i)

    #result = HMMC::CreateClassRoom.run(:name => params[:class][:name], :school_id => params[:school_id].to_i)
    #HMMC::AddMilesClass.run(:school_id => params[:school_id].to_i, :classroom => result.classroom.id, :milesclass => params[:class][:miles].to_i)
    @school = result.school
    redirect_to "/schools/#{@school.id}"
  end
end
