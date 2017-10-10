class AddHostelToPreftab1 < ActiveRecord::Migration[5.0]
  def change
  	add_column :preftab1s,:hostel, :string
  end
end
