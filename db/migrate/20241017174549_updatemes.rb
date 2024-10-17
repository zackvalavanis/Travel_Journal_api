class Updatemes < ActiveRecord::Migration[7.1]
  def change
    add_column :mes, :information, :text
    remove_column :mes, :Information
  end
end
