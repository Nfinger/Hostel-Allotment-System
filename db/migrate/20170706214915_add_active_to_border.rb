class AddActiveToBorder < ActiveRecord::Migration[5.0]
  def change
  	add_column :borders, :active, :boolean, :default=>false
  end
end
