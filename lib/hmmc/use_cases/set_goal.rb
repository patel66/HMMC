module HMMC
  class Setgoal < UseCase
    def run(inputs)
      goal_amount = inputs[:goal]
      school_id = inputs[:school_id]

      school = HMMC.db.get_school(school_id)

      school.goal = goal_amount
      success(:school => school)
    end
  end
end

# result = subject.run(:goal => 5000)
