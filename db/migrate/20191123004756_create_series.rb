class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series do |t|
      t.integer :data_logger_id
      t.string :name

      t.timestamps
    end
  end
end
