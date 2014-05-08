class CreateActivity < ActiveRecord::Migration
  def change
    # TODO
    create_table :activities do |t|
      t.integer :miles
      t.integer :students
      t.datetime :date
      t.timestamps
    end
  end
end
