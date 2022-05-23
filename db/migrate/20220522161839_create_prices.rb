class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.decimal :min_vol
      t.decimal :max_vol
      t.decimal :min_weight
      t.decimal :max_weight
      t.decimal :price_per_km

      t.timestamps
    end
  end
end
