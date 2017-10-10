class RoomAllotementsController < ApplicationController
	before_action :is_allocation_start, only: [:show]
	def show
		@hostels=session[:hostel]
		@floors=session[:floor]
		@rooms=setdata(@hostels,@floors)
		@filled_rooms=RoomChoice.all.group(:room_no,:hostel)
		@border=Border.find_by(id:session[:user_id])
		@hos_room=saved_choices
	end

	def create
		@room_mate=params[:roommate1]
		@border=allot_room(@room_mate)
		if @border.errors.any?
			@hostels=session[:hostel]
			@floors=session[:floor]
			@rooms=setdata(@hostels,@floors)
			render 'show'
		end
		@choice=Choice.find_by(current_user.roll_no)
	end

	def add
		@selected_hostel=params[:hostel1]
		@selected_room=params[:selected_room]
		border=Border.find_by(id:session[:user_id])
		choice=Choice.find_by(border_roll_no:border.roll_no)
		if choice.nil?
				choice=Choice.create(border_roll_no:border.roll_no,cgpi:border.student_result.cgpi,year:session[:year])
		end
		if choice.room_choices.find_by(hostel:@selected_hostel,room_no:@selected_room[0]).nil? 
			#to validate duplicates choices
			choice.room_choices.create(hostel:@selected_hostel,room_no:@selected_room[0])
			@flag=1
		else
			@flag=0
		end
		@hos_room=saved_choices
		respond_to do |f|
    	f.html { redirect_to roomallotement_path }
    	f.js
    	end
	end

	def remove 
		@choice_id=params[:selected_choices][0]
		border=Border.find_by(id:session[:user_id])
		choice=Choice.find_by(border_roll_no:border.roll_no)
		RoomChoice.destroy(@choice_id)
		@hos_room=saved_choices
		respond_to do |f|
    	f.html { redirect_to roomallotement_path }
    	f.js
    	end
	end

	def start
		#it will start new allotement
		AlloteHostel.destroy_all
		Preference1.destroy_all
		Preference2.destroy_all
		Preference3.destroy_all
		Preference4.destroy_all
		Border.update_all(alloted:false,hostel_id:1,hostel_type:"Temphostel",grouped:false)
		Hostel.all.each do |hostel|
			hostel.hostel_name.constantize.update_all(active:nil)
		end
		Choice.destroy_all
		flash[:success]="New allotement is start now you can set allotement schedule"
		redirect_to current_admin
	end

	def allotement
		preftabs=['1','2','3','4']
		preftabs.each do |preftab|
			#preftab_obj=preftab.constantize
			a=Choice.where(year:preftab).order('cgpi DESC')
			a.each do |student|
				#hostel=student.hostel.constantize
				@roommates=[]
				@rooms=[]
				student.roommates.all.each do |roommate|
					if !roommate.roommate.empty?
						@roommates.push(roommate.roommate)
					end
				end
				border=Border.find_by(roll_no:student.border_roll_no)
				roommate1=Border.find_by(roll_no:@roommates[0])
				roommate2=Border.find_by(roll_no:@roommates[1])
				@c=student.room_choices.all
				student.room_choices.all.each do |room|
					@rooms.push([room.hostel,room.room_no])
				end
				#@rooms=[student.room1,student.room2]
				no_of_borders=@roommates.length+1
				flag=0
				if flag==0
					@rooms.each do |room|
						hostel=room[0].constantize
						room_obj=hostel.find_by(room_no:room[1])
						if (room_obj.no_of_rooms - room_obj.borders.count)>=no_of_borders
							border.update_attributes(hostel_id:room_obj.id,hostel_type:room_obj.class.name,alloted:true)
							@roommates.each do |roommate|
								roommate_obj=Border.find_by(roll_no:roommate)
								roommate_obj.update_attributes(hostel_id:room_obj.id,hostel_type:room_obj.class.name,alloted:true)
							end
							
							flag=1
							break
						end
							
					end
				end
					#alloting only for two student out of three
				if flag==0
					@rooms.each do |room|
						hostel=room[0].constantize
						room_obj=hostel.find_by(room_no:room[1])
						
						if (room_obj.no_of_rooms - room_obj.borders.count)>=no_of_borders-1
							
							border.update_attributes(hostel_id:room_obj.id,hostel_type:room_obj.class.name,alloted:true)
					#		@g.push(border.roll_no)
							roommate1.update_attributes(hostel_id:room_obj.id,hostel_type:room_obj.class.name,alloted:true)
						#	@g.push(roommate1.roll_no)
							flag=1
						
							#allot it
							break
						end
					end
				end
				if flag==0
					@rooms.each do |room|
						hostel=room[0].constantize
						room_obj=hostel.find_by(room_no:room[1])
						
						if (room_obj.no_of_rooms - room_obj.borders.count)>=no_of_borders-2
							border.update_attributes(hostel_id:room_obj.id,hostel_type:room_obj.class.name,alloted:true)
						
							flag=1
						
							#allot it
							break
						end
					end
				end
			end
			#deleting Preftab after room allotment
			Choice.where(year:preftab).destroy_all
		end

	end

	private
		def is_allocation_start
			unless !session[:hostel].nil?
				if logged_in?
	      		redirect_to(profile_path(current_user.id)) 
	      else
	      		redirect_to(root_url)
	      end
	    end
    end
    def is_room_alloted?
    	current_user.alloted
    end
end
