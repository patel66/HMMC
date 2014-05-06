module HMMC
  class AddMilesClass < UseCase
    def run(inputs)
      school_id = inputs[:school_id]
      classroom_id = inputs[:classroom] #id
      milesclassroom = inputs[:milesclass] #miles

      return failure(:can_not_add_more_then_100) if milesclassroom >= 100

      school = HMMC.db.get_school(school_id)
      retreived_classroom = school.classrooms.find {|c_room| c_room.id == classroom_id}

      retreived_classroom.add_miles(milesclassroom)
      updated_classroom = HMMC.db.update_classroom(:name => retreived_classroom.name, :classroom_id => retreived_classroom.id, :miles => milesclassroom) # classroom is already here, so add twice?

      school.total_miles
      success(:miles => milesclassroom, :school => school)
    end
  end
end

