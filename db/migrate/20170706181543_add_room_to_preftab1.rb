class AddRoomToPreftab1 < ActiveRecord::Migration[5.0]
  def change
  	add_column :preftab1s, :room3, :string
  	add_column :preftab1s, :room4, :string
  	add_column :preftab1s, :room5, :string
  end
end
