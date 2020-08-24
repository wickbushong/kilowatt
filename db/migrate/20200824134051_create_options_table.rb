class CreateOptionsTable < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.float :power
      t.float :standby
    end
  end
end
