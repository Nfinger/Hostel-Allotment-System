class Choice < ApplicationRecord
	has_many :roommates ,:dependent => :destroy

	has_many :room_choices,:dependent => :destroy
end
