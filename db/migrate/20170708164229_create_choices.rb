class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.string :border_roll_no
      t.float :cgpi
      t.string :year
      t.timestamps
    end
  end
end
