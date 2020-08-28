class CreateDeviceGroupsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :device_groups do |t|
      t.integer :group_id
      t.integer :device_id
    end
  end
end
