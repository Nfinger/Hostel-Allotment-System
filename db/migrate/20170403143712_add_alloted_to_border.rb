class AddAllotedToBorder < ActiveRecord::Migration[5.0]
  def change
    add_column :borders, :alloted, :boolean,:default=>false
  end
end
