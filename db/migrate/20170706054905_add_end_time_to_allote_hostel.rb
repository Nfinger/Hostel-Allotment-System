class AddEndTimeToAlloteHostel < ActiveRecord::Migration[5.0]
  def change
  	add_column :allote_hostels, :endtime, :datetime
  end
end
