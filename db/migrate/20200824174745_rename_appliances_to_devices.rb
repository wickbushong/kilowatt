class RenameAppliancesToDevices < ActiveRecord::Migration[4.2]
  def change
    rename_table :appliances, :devices
  end
end
