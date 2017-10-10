class AddStartTimeToAlloteHostel < ActiveRecord::Migration[5.0]
  def change
  	add_column :allote_hostels, :starttime, :datetime
  end
end
