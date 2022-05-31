class CreateQuotations < ActiveRecord::Migration[7.0]
  def change
    create_table :quotations do |t|
      t.integer :height
      t.integer :length
      t.integer :width
      t.integer :weight
      t.integer :distance
      t.decimal :volume

      t.timestamps
    end
  end
end
