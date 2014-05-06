module HMMC
  class AddMilesClass < UseCase
    def run(inputs)
      class_name = inputs[:name]
      class_id = inputs[:id]
      school_id = inputs[:school_id]


      classroom = inputs[:classroom]
      milesclassroom = inputs[:milesclass]
      school = inputs[:school]

      created_classroom = HMMC.db.create_classroom(:name=> class_name, :school_id=> school_id, :miles=>0)

      return failure(:no_school_with_that_id) if HMMC.db.get_school(school_id) == nil
      return failure(:can_not_add_more_then_100) if inputs[:milesclass] >= 100
      retreived_school = HMMC.db.get_school(school_id)
      retreived_school.add_classroom(classroom)
      classroom.add_miles(milesclassroom)

      success(:miles => milesclassroom, :school => school)
    end
  end
end
