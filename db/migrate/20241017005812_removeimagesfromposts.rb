class Removeimagesfromposts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :images
  end
end
