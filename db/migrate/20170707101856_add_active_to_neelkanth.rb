class AddActiveToNeelkanth < ActiveRecord::Migration[5.0]
  def change
  	add_column :neelkanths, :active, :string, :default=>nil
  	add_column :himadris, :active, :string, :default=>nil
  	add_column :himgiris, :active, :string, :default=>nil
  end
end
