class AddFloorToNeelkanth < ActiveRecord::Migration[5.0]
  def change
  	add_column :neelkanths, :floor, :string
  end
end
