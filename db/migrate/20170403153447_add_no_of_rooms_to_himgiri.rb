class AddNoOfRoomsToHimgiri < ActiveRecord::Migration[5.0]
  def change
    add_column :himgiris, :no_of_rooms, :integer,:default=>3
  end
end
