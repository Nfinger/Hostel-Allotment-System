class AddAllotedToPreference3 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference3s, :alloted, :integer,:default =>0
  end
end
