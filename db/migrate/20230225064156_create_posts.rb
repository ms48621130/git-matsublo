class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.string :matsuri_name, null:false
      t.string :season, null:false
      t.text :article, null:false
      t.timestamps
    end
  end
end
