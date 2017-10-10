class CreateRoommates < ActiveRecord::Migration[5.0]
  def change
    create_table :roommates do |t|
    	t.string :roommate
    	t.belongs_to :choice, index: true
      t.timestamps
    end
  end
end
