module HMMC
  class GetSchoolMiles < UseCase
    def run(params)

      school_id = params[:school_id]
      school = HMMC.db.get_school(school_id)
      #classroom = params[:classroom]
      #Makes sure the school exists

      return failure :school_doesnt_exist if school.nil?
      return failure :classroom_doesnt_exist if school.classrooms.empty?

      #If all else is good, creates a user model.
      school_miles = school.total_miles

      success(:miles => school_miles, :school => school)
    end

  end
end
