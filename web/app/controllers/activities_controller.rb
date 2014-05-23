class ActivitiesController < ApplicationController
  def new

  end

  def create

    # @school_we_want = HMMC.db.get_school(params[:id].to_i)
    result = HMMC::CreateActivity.run(:miles => params[:miles].to_i, :students => params[:students].to_i, :date => params[:date], :school_id => params[:school_id].to_i)
    @user = HMMC.db.get_user_by_sid(session[:app_sid])
    @users_school = HMMC.db.get_school_from_user_id(@user.id)
    @schools = HMMC.db.get_all_schools_sign_up
    @sorted_schools = @schools.sort_by {|school| -school.total_miles_school}
    binding.pry
    @sorted_schools.each_index do |index|
      if @sorted_schools[index].id == @users_school.id
        @rank = index + 1
      end
    end
    # national_rank = HMMC.db.get_national_ranking
    # binding.pry
    # national_rank.each_index do |index|

    #   if national_rank[index].id == @users_school.id
    #      @rank = index + 1
    #   end
    # end

   puts @users_school.state
   puts @rank
    @school = result.school
    respond_to do |format|
        format.html
        format.json  { render :json => { school: @school, schoolmiles: @school.total_miles_school.to_i, rank:@rank} }
    end
  end

end
