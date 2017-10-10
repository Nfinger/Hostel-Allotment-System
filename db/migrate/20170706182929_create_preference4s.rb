class CreatePreference4s < ActiveRecord::Migration[5.0]
  def change
    create_table :preference4s do |t|
    	t.string :roll_no
      t.float :cgpi
      t.integer :alloted, :default =>0
      t.datetime :start
      t.datetime :endtime
      t.timestamps
    end
  end
end
