class AddEndTimeToPreference3 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference3s, :endtime, :datetime
  end
end
