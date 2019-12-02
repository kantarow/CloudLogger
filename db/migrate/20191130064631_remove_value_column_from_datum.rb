class RemoveValueColumnFromDatum < ActiveRecord::Migration[6.0]
  def up
    remove_column :data, :value, :float
  end

  def down
    add_column :data, :value, :float
  end
end
