module HMMC
  class AddMilesClass < UseCase
    def run(inputs)
      class_name = inputs[:name]
      class_id = inputs[:id]
      school_id = inputs[:school_id]

      this_class = inputs[:classroom]

      milesclassroom = inputs[:milesclass]
      school = inputs[:school]

      created_classroom = HMMC.db.get_classroom(this_class.id)

      return failure(:no_school_with_that_id) if HMMC.db.get_school(school_id) == nil
      return failure(:can_not_add_more_then_100) if inputs[:milesclass] >= 100
      retreived_school = HMMC.db.get_school(school_id)
      retreived_school.add_classroom(created_classroom)
      created_classroom.add_miles(milesclassroom)
      retreived_school.total_miles
      success(:miles => milesclassroom, :school => retreived_school)
    end
  end
end

# result = subject.run(:classroom => history_class, :school => school, :milesclass => 45)
#    result = subject.run(:classroom => math_class, :school => school, :milesclass => 30)
