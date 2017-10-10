class CreateBorders < ActiveRecord::Migration[5.0]
  def change
    create_table :borders do |t|
      t.string :roll_no
      t.string :name
      t.string :email
      t.text :address
      t.string :phone_no
      t.string :room_no
      t.integer :hostel_id
      t.string  :hostel_type
      t.belongs_to :student_result, index: true
      t.timestamps
    end
    add_index :borders, [:hostel_type, :hostel_id]
  end
end
