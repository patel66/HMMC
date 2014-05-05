class Addclassroom < ActiveRecord::Migration
  def change
    # TODO
     create_table :classrooms do |t|
      t.string :name
      t.integer :miles
      t.references :school
    end
  end
end
