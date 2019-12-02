class AddXAndYColumnsToData < ActiveRecord::Migration[6.0]
  def up
    add_column :data, :x, :float
    add_column :data, :y, :float
  end

  def down
    remove_column :data, :x, :float
    remove_column :data, :y, :float
  end
end
