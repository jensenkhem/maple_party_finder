class AddLevelAndStatToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :level, :integer
    add_column :characters, :stat, :decimal, precision: 2
  end
end
