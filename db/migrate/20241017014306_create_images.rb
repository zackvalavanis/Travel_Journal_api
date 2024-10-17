class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.integer :post_id
      t.text :image_url

      t.timestamps
    end
  end
end
