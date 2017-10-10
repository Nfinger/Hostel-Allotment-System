class AddPasswordDigestToBorders < ActiveRecord::Migration[5.0]
  def change
    add_column :borders, :password_digest, :string
  end
end
