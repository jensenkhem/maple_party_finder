class AddColToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :name, :string, unique: true
    add_column :characters, :class, :string
  end
end
