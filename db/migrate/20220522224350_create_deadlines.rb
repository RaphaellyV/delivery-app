class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.integer :min_distance
      t.integer :max_distance
      t.integer :max_days

      t.timestamps
    end
  end
end
