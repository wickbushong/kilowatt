class CreateAppliancesTable < ActiveRecord::Migration
  def change
    create_table :appliances do |t|
      t.string :name
      t.float :power
      t.float :standby
      t.float :usage
    end
  end
end
