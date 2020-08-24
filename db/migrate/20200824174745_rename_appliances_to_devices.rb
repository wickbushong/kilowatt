class RenameAppliancesToDevices < ActiveRecord::Migration
  def change
    rename_table :appliances, :devices
  end
end
