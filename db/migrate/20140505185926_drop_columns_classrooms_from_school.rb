class DropColumnsClassroomsFromSchool < ActiveRecord::Migration
  def change
    # TODO
    remove_columns(:schools,:classrooms,:string)
  end
end

