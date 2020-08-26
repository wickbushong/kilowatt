class CreateGroupsAndDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id
    end

    create_table :devices do |t|
      t.string :name
      t.float :power
      t.float :standby
      t.float :usage
      t.integer :user_id
    end

    create_table :device_groups do |t|
      t.integer :group_id
      t.integer :device_id
  end
end
