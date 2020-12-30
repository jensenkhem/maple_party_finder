class CreateGroupsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :groups, :characters do |t|
      t.index :group_id
      t.index :character_id
    end
  end
end
