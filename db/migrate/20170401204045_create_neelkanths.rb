class CreateNeelkanths < ActiveRecord::Migration[5.0]
  def change
    create_table :neelkanths do |t|
      t.string :room_no

      t.timestamps
    end
  end
end
