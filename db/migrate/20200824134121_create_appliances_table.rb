class CreateAppliancesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :appliances do |t|
      t.string :name
      t.float :power
      t.float :standby
      t.float :usage
      t.integer :user_id
    end
  end
end
