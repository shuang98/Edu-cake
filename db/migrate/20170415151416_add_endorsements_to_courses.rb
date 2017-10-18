class AddEndorsementsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :endorsements, :integer
  end
end
