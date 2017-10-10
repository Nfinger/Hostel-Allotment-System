class StudentResult < ApplicationRecord
	has_one :border
	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (6..16).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    if row["roll_no"].class==Float
	    	row["roll_no"]=row["roll_no"].to_i
	    end
	    result = find_by_roll_no(row["roll_no"])||new
	    result.attributes = row.to_hash.slice(*accessible_attributes)
	    result.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Csv.new(file.path, nil, :ignore)
	  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	 end

	private
		 	
		def self.accessible_attributes
			 ["roll_no", "cgpi"]
		end
end
