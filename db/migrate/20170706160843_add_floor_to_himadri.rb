class AddFloorToHimadri < ActiveRecord::Migration[5.0]
  def change
  	add_column :himadris, :floor, :string
  end
end
