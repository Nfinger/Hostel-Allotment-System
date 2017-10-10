class CreatePreference1s < ActiveRecord::Migration[5.0]
  def change
    create_table :preference1s do |t|
      t.string :roll_no
      t.float :cgpi

      t.timestamps
    end
  end
end
