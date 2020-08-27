class RemoveUserIdFromDevicesTable < ActiveRecord::Migration[4.2]
  def change
    remove_column :devices, :user_id, :integer
  end
end
