class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :video_link
      t.integer :theme_id

      t.timestamps
    end
    add_index :exercises, :theme_id
  end
end
