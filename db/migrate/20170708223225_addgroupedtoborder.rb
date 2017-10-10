class Addgroupedtoborder < ActiveRecord::Migration[5.0]
  def change
  	add_column :borders, :grouped, :boolean
  end
end
