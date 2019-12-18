class ChangeXToDatetimeInDatum < ActiveRecord::Migration[6.0]
  def change
    change_column :data, :x, :datetime
  end
end
