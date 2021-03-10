class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :duration_minutes
      t.integer :mood_rating
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
