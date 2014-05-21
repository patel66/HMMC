class Activityaddcolumn < ActiveRecord::Migration
  def change
    # TODO
    change_table :activities do |t|
      t.references :school
    end
  end
end

