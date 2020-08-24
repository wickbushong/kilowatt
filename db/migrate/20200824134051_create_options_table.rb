class CreateOptionsTable < ActiveRecord::Migration[4.2]
  def change
    create_table :options do |t|
      t.string :name
      t.float :power
      t.float :standby
    end
  end
end
