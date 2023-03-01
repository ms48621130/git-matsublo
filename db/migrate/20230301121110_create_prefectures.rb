class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.integer :post_id, null: false
      t.integer :area, null: false, default: 0
      t.timestamps
    end
  end
end
