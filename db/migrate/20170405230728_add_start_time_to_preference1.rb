class AddStartTimeToPreference1 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference1s, :start, :datetime
  end
end
