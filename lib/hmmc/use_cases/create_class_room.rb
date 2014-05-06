module HMMC
  class CreateClassRoom  < UseCase
    def run(inputs)
      school_id = inputs[:school_id]
      classroom = inputs[:classroom]
      classroomname = inputs[:name]

      return failure :school_does_not_exist if HMMC.db.get_school(school_id) == nil
      return failure :invalid_name if classroomname.empty?
       success(:classroom => classroom)
    end
  end
end

# result = subject.run(:school_id=> classroom.school_id, :classroom => classroom)
