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
			return failure :invalid_number_students if school.students <= students

			activity = HMMC.db.create_activity(:miles=> miles, :students => students, :date => date, :school_id => school.id )
			
			success(:activity => activity)
		end
	end 
end