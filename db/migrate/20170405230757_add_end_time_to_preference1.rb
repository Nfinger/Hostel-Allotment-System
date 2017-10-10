class AddEndTimeToPreference1 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference1s, :endtime, :datetime
  end
end
