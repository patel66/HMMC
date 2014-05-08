class AddColumnNumStudentsSchool < ActiveRecord::Migration
  def change
    # TODO
    add_column(:schools,:students,:integer)
  end
end


