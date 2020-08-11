class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.string :name,         null: false
      t.string :image,        null: false
      t.integer :price,       null: false
      t.text :about,          null: false
      t.integer :genre_id,     null: false
      t.integer :condition_id,    null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id,         null: false
      t.integer :days_id,         null: false
      t.integer :saler_id
      t.integer :buyer_id
      t.timestamps
    end
  end
end
