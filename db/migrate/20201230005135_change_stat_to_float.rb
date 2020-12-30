class ChangeStatToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :characters, :stat, :float
  end
end
