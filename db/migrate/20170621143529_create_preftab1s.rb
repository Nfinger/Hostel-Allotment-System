class CreatePreftab1s < ActiveRecord::Migration[5.0]
  def change
    create_table :preftab1s do |t|
      t.string :roll_no
      t.float :cgpi
      t.string :roomie1
      t.string :roomie2
      t.string :room1
      t.string :room2

      t.timestamps
    end
  end
end
