class AddStartTimeToPreference2 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference2s, :start, :datetime
  end
end
