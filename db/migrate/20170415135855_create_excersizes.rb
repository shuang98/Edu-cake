class Createexercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.text :question
      t.text :answer
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
