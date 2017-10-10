class AddNoOfRoomsToHimadri < ActiveRecord::Migration[5.0]
  def change
    add_column :himadris, :no_of_rooms, :integer,:default=>3
  end
end
