class CreateBodies < ActiveRecord::Migration[5.0]
  def change
    create_table :bodies do |t|
      t.string :body
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
