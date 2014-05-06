module HMMC
  class CreateClassRoom  < UseCase
    def run(inputs)
      school_id = inputs[:school_id]
      classroom = inputs[:classroom]
      classroomname = inputs[:name]

      return failure :school_does_not_exist if HMMC.db.get_school(school_id) == nil
      return failure :invalid_name if classroomname.empty?

      school = HMMC.db.get_school(school_id)
      cr = HMMC.db.create_classroom(inputs)
      school.add_classroom(cr)
      success(:classroom => cr)

    end
  end
end

