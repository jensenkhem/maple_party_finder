class AddColToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :name, :string
    add_column :groups, :creator, :string
  end
end
