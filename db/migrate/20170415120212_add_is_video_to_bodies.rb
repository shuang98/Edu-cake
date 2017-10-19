class AddIsVideoToBodies < ActiveRecord::Migration[5.0]
  def change
    add_column :bodies, :is_video, :boolean
  end
end
