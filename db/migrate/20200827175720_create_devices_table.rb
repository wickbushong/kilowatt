class CreateDevicesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.float :power
      t.float :standby
      t.float :usage
    end
  end
end
