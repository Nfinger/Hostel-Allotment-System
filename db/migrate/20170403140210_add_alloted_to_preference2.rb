class AddAllotedToPreference2 < ActiveRecord::Migration[5.0]
  def change
    add_column :preference2s, :alloted, :integer,:default=>0
  end
end
