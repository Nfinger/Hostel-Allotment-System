class CreateRoomChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :room_choices do |t|
      t.string :hostel
      t.string :room_no
      t.timestamps
      t.belongs_to :choice, index: true
    end
  end
end
