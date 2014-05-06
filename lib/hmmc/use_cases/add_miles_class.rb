module HMMC
  class AddMilesClass < UseCase
    def run(inputs)
      school_id = inputs[:school_id]
      classroom = inputs[:classroom] #name
      milesclassroom = inputs[:milesclass] #miles

      # binding.pry
      retreived_classroom = HMMC.db.get_class_by_name(classroom) # problem is, create class here

      # return failure(:no_school_with_that_id) if HMMC.db.get_school(school_id) == nil
      return failure(:can_not_add_more_then_100) if inputs[:milesclass] >= 100

      retreived_school = HMMC.db.get_school(school_id) # problem 2, create a school here
      #classrooms_school = HMMC.db.get_classrooms_for_school(school_id)

      HMMC.db.update_classroom(retreived_classroom) # classroom is already here, so add twice?


     # retreived_classroom.add_miles(milesclassroom)
      retreived_school.total_miles
      success(:miles => milesclassroom, :school => retreived_school)
    end
  end
end

