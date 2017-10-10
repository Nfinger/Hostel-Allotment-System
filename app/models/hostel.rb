class Hostel < ApplicationRecord
	validates :hostel_name ,presence: true,uniqueness:true
end
