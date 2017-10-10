module RoomAllotementsHelper
	def setdata(hostels,floor_dic)
		rooms={}
		hostels.each do |hostel|
			hostel_class=hostel.constantize
			kamre=hostel_class.where(floor:floor_dic[hostel],active:session[:year])
			kamre.each do |room|
				if room.no_of_rooms>room.borders.count
					if rooms[hostel].nil?
						rooms[hostel]=[[room.room_no,room.no_of_rooms-room.borders.count]]
					else
						rooms[hostel].push([room.room_no,room.no_of_rooms-room.borders.count])
					end
				end
			end
		end
		return rooms
	end

	def is_hostel_active?(hostel)
		preferences=["Preference1","Preference2","Preference3","Preference4"]
		pref=""
		preferences.each do |preference|
     		 preference_model=preference.constantize   #.constantize will convert class name to actual class
     		 if !preference_model.find_by(roll_no:current_user.roll_no).nil?
      			pref=preference
      		end
      	end
      	hostel_obj=AlloteHostel.find_by(preference:pref,hostel:hostel)
      	if (hostel_obj.starttime<=DateTime.now && hostel_obj.endtime>=DateTime.now)
						return true
		else
						return false
		end
    end
	def allot_room1(hostel,room,room2,roommate1)
			border=Border.find_by(id:session[:user_id])
			preferences=["Preference1","Preference2","Preference3"]
			hostel_class=hostel.constantize  #.constattize will convert class name to actual class
			room_obj=hostel_class.find_by(room_no:room)
			allote_hostel_obj=AlloteHostel.find_by(hostel:hostel)
			preference=allote_hostel_obj.preference
			preference_class=preference.constantize
			roommate_length=0
			roommate1.each do |roommate|
				
				if !roommate.empty?
					if !preference_class.find_by(roll_no:roommate).nil?
						if !(a=Border.find_by(roll_no:roommate)).nil?
							if a.alloted==false  #mean available for allotment
								roommate_length=roommate_length+1	
							else
								border.errors.add(:base, "RollNo #{roommate} alloted a room already")
								return border
							end
						else
							border.errors.add(:base, "RollNo #{roommate} is not hostler Please enter a Valid RollNo")
							return border
						end
					else
						border.errors.add(:base,"RollNo #{roommate} is not allowed ")
						return border
					end
				
				end
			end
			if (room_obj.no_of_rooms - room_obj.borders.count)<=roommate_length 
				border.errors.add(:base, "only #{room_obj.no_of_rooms-room_obj.borders.count} bed available")
				return border
			else
				roommate1.each do |roommate|
					if !roommate.empty?
						border=Border.find_by(roll_no:roommate)
						border.update_attributes(hostel_id:room_obj.id,hostel_type:room_obj.class.name,alloted:true)
					end
				end
			end
			border=Border.find_by(id:session[:user_id])
			border.update_attributes(hostel_id:room_obj.id,hostel_type:room_obj.class.name,alloted:true)


			return border

		
	end

	def allot_room(roommate1)
			border=Border.find_by(id:session[:user_id])
			preferences=["Preference1","Preference2","Preference3","Preference4"]
			preference=""
			preferences.each do |temp_preference|
				preference_model=temp_preference.constantize   #.constantize will convert class name to actual class
      			if !preference_model.find_by(roll_no:current_user.roll_no).nil?
      				preference=temp_preference
      			end
      		end

			preference_class=preference.constantize
			roommate_length=0
			if roommate1.include? current_user.roll_no
				current_user.errors.add(:base, "Do not enter your own roll_no")
				return current_user
			end
			if !roommate1.include? ""
				if roommate1.uniq.length!=roommate1.length
					current_user.errors.add(:base, "roomates are same")
					return current_user
				end
			end
			roommate1.each do |roommate|
				
				if !roommate.empty?
					if !preference_class.find_by(roll_no:roommate).nil?
						if !(a=Border.find_by(roll_no:roommate)).nil?
							if a.alloted==false  #mean available for allotment
								if !a.grouped and Choice.find_by(border_roll_no:roommate).nil?
									roommate_length=roommate_length+1
								else
									border.errors.add(:base, "RollNo #{roommate} is already assingned a group")
								end
							else
								border.errors.add(:base, "RollNo #{roommate} alloted a room already")
								return border
							end
						else
							border.errors.add(:base, "RollNo #{roommate} is not hostler Please enter a Valid RollNo")
							return border
						end
					else
						border.errors.add(:base,"RollNo #{roommate} is not allowed ")
						return border
					end
				
				end
			end
			choice=Choice.find_by(border_roll_no:border.roll_no)
			if choice.nil?
				choice=Choice.create(border_roll_no:border.roll_no,cgpi:border.student_result.cgpi,year:session[:year])
			end
			roommate1.each do |roommate|
				if !roommate.empty?
					choice.roommates.create(roommate:roommate)
					roomie=Border.find_by(roll_no:roommate)
					roomie.update(grouped:true)
				end
			end
			return border
	end

	def saved_choices
		hos_room=[]
		border=Border.find_by(id:session[:user_id])
		choice=Choice.find_by(border_roll_no:border.roll_no)
		if !choice.nil?
			choices=choice.room_choices
			if !choices.nil?
				choices.each do |temp_choice|
					hos_room.push([temp_choice.id,temp_choice.hostel,temp_choice.room_no])
				end
			end
		end
		return hos_room
	end

end
