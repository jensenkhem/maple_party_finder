class DeleteCol < ActiveRecord::Migration[6.0]
  def change
    remove_column :characters, :users_id
  end
end
