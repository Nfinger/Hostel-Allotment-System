class AddFloorToAlloteHostel < ActiveRecord::Migration[5.0]
  def change
  	add_column :allote_hostels, :floor, :string
  end
end
