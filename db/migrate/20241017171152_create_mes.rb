class CreateMes < ActiveRecord::Migration[7.1]
  def change
    create_table :mes do |t|
      t.integer :user_id
      t.text :Information

      t.timestamps
    end
  end
end
