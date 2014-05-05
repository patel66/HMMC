class CreateSchools < ActiveRecord::Migration
  def change
    # TODO
    create_table :schools do |t|
      t.string :name
      t.references :user
      t.string :address
      t.string :classrooms
    end
  end
end

