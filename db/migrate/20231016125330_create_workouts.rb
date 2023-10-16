class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.integer :sets
      t.integer :reps
      t.float :weight
      t.integer :exercise_id
      t.integer :workout_session_id

      t.timestamps
    end
    add_index :workouts, :exercise_id
    add_index :workouts, :workout_session_id
  end
end
