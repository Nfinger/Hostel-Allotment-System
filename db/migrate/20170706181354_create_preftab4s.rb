class CreatePreftab4s < ActiveRecord::Migration[5.0]
  def change
    create_table :preftab4s do |t|
    	t.string :roll_no
      t.float :cgpi
      t.string :hostel
      t.string :roomie1
      t.string :roomie2
      t.string :room1
      t.string :room2
      t.string :room3
      t.string :room4
      t.string :room5
      t.timestamps
      t.timestamps
    end
  end
end
