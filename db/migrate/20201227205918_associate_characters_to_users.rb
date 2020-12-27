class AssociateCharactersToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :user, index: true, foreign_key: true
  end
end
