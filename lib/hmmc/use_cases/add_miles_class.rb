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
    end
  end
end

# if milesclassroom, is more then 100, throw an error
# result = subject.run({:classroom=> history_class, :milesclass=> 110, :school=> school})


# odule Timeline
#   class CreateEvent < UseCase
#     def run(inputs)
#       name = inputs[:name]
#       team_id = inputs[:team_id].to_i
#       user_id = inputs[:user_id].to_i
#       return failure(:no_team_with_that_id) if Timeline.db.get_team(team_id) ==nil
#       return failure(:that_user_does_not_exist) if Timeline.db.get_user(user_id) == nil
#       return failure(:event_name_not_valid) if name.empty?
#       event = Timeline.db.create_event(name: inputs[:name], team_id: inputs[:team_id].to_i, user_id: inputs[:user_id].to_i )
#       team = Timeline.db.get_team(team_id)
#       success(:event=>event, :team=> team)
#    #It should error check for user_id, team_id, and blank names.
#     end
#   end
# end
