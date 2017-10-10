class AddAllotedToPreference1 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference1s, :alloted, :integer,:default =>0
  end
end
