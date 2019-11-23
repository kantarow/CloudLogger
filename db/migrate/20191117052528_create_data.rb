class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.integer :series_id
      t.float :value
      t.timestamps
    end
  end
end
