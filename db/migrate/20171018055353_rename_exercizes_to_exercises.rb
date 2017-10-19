class RenameExercizesToExercises < ActiveRecord::Migration[5.0]
  def change
    rename_table :excersizes, :exercises
  end
end