class Dropclassroom < ActiveRecord::Migration

    # TODO
  def up
    drop_table :classrooms
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end


end
