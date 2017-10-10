class CreatePreference3s < ActiveRecord::Migration[5.0]
  def change
    create_table :preference3s do |t|
      t.string :roll_no
      t.float :cgpi
      t.timestamps
    end
  end
end
