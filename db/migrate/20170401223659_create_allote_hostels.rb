class CreateAlloteHostels < ActiveRecord::Migration[5.0]
  def change
    create_table :allote_hostels do |t|
      t.string :preference
      t.string :hostel
      t.timestamps
    end
  end
end
