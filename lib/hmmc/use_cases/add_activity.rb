module HMMC
	class  CreateActivity < UseCase
		def run(inputs)
			school_id = inputs[:school_id]
			miles = inputs[:miles]
			students = inputs[:students]
			date = inputs[:date]

			school = HMMC.db.get_school(school_id)
			return failure :no_miles if miles == nil
			return failure :no_students if students == nil
			return failure :invalid_number_students if school.students.to_i <= students.to_i

			activity = HMMC.db.create_activity(:miles=> miles, :students => students, :date => date, :school_id => school_id )
			school.add_activity(activity)
			# updated_school = HMMC.db.update_school(school.instance_values)
			# binding.pry
			success(:activity => activity, :school => school )
		end
	end
end
