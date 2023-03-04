class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :matsuri_name, null:false
      t.integer :season, null:false, default: 1
      t.text :article, null:false
      t.integer :area, null: false, default: 0
      t.timestamps
    end
  end
end
