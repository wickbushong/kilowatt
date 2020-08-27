class AddUserIdToGroupsTable < ActiveRecord::Migration[4.2]
  def change
    change_table :groups do |t|
      t.integer :user_id
    end
  end
end
