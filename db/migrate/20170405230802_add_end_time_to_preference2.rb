class AddEndTimeToPreference2 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference2s, :endtime, :datetime
  end
end
