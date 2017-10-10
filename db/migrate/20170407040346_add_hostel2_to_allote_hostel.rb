class AddHostel2ToAlloteHostel < ActiveRecord::Migration[5.0]
  def change
    add_column :allote_hostels, :hostel2, :string
  end
end
