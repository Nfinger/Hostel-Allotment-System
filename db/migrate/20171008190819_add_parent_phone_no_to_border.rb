class AddParentPhoneNoToBorder < ActiveRecord::Migration[5.0]
  def change
     
  	add_column :borders, :parent_phone_no, :string
  end
end
