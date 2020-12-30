class AddBossToGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :boss, :string
  end
end
