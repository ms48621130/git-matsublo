class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null:false
      t.integer :post_id, null:false
      t.float :star, null:false
      t.string :title, null:false
      t.text :text,null:false
      t.timestamps
    end
  end
end
