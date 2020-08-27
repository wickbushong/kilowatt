class CreateGroupsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
