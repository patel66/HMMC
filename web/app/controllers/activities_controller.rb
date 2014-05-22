class ActivitiesController < ApplicationController
  def new

  end

  def create

    result = HMMC::CreateActivity.run(:miles => params[:miles].to_i, :students => params[:students].to_i, :date => params[:date], :school_id => params[:school_id].to_i)
    @school = result.school
    respond_to do |format|
        format.html
        format.json  { render :json => { school: @school, schoolmiles: @school.total_miles_school.to_i} }
    end
  end

end
