module HMMC
  class AddMilesClass < UseCase
    def run(inputs)
      class_name = inputs[:name]
      class_id = inputs[:id]
      school_id = inputs[:school_id]
    end
  end
end



# result.subject.run({:name=> history_class.name,:school_id => history_class.school_id,:id=> history_class.id })

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
