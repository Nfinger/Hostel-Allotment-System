class CreateTemphostels < ActiveRecord::Migration[5.0]
  def change
    create_table :temphostels do |t|
      t.string :room_no
      t.string :floor
      t.string :no_of_rooms

      t.timestamps
    end
  end
end
