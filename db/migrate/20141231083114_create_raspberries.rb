class CreateRaspberries < ActiveRecord::Migration
  def change
    create_table :raspberries do |t|
      t.integer :user_id
      t.string :serial_number
      t.float :temperature
      t.float :humidity
      t.float :moisture
      t.timestamps
    end
  end
end
