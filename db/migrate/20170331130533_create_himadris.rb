class CreateHimadris < ActiveRecord::Migration[5.0]
  def change
    create_table :himadris do |t|
      t.string :room_no

      t.timestamps
    end
  end
end
