class CreatePreference2s < ActiveRecord::Migration[5.0]
  def change
    create_table :preference2s do |t|
	  t.string :roll_no
      t.float :cgpi

      t.timestamps
    end
  end
end
