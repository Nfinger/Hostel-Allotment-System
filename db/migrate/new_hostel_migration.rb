class NewHostel < ActiveRecord::Migration[5.0]
  def self.create_with(name)  
 begin
    create_table name.to_sym do |t|
      t.string :room_no
      t.string :floor
      t.integer :no_of_rooms
      t.string :active
      t.timestamps
    end
    rescue Exception => e
      return
    end

    model_file = File.join("app", "models", name.singularize+".rb")
    model_name = name.singularize.capitalize
    File.open(model_file, "w+") do |f|
      f << "class #{model_name} < ParentHostel\n has_many :borders, as: :hostel\n end"
    end
  end 
end