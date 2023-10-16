class CreateWorkoutSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :workout_sessions do |t|
      t.date :date
      t.integer :total_duration
      t.integer :user_id

      t.timestamps
    end
    add_index :workout_sessions, :user_id
  end
end
