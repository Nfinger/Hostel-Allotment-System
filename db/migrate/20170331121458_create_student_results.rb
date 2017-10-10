class CreateStudentResults < ActiveRecord::Migration[5.0]
  def change
    create_table :student_results do |t|
      t.string :roll_no
      t.float :sgpi
      t.float :cgpi
      t.string :semester

      t.timestamps
    end
  end
end
