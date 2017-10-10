class AddStartTimeToPreference3 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference3s, :start, :datetime
  end
end
