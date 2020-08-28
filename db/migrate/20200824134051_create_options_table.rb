class CreateOptionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :name
      t.float :power
      t.float :standby
    end
  end
end
