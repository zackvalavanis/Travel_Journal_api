class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :images
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
