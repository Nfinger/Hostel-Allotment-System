class PreferencesController < ApplicationController
	def create1
		student_detail=[]
		@year=params[:year]
		@hostel1=params[:hostel1]
		@hostel2=params[:hostel2]
		if !(@hostel1.nil? or @hostel2.nil?)
			@hostel1.each do |h|
				hostel_class=h.constantize  #constantize convert class name to actual class
				rooms=hostel_class.all
				rooms.each do |room|
					room.borders.each do |border|
						roll_no=border.roll_no
						cgpi=border.student_result.cgpi
						border.update_attributes(alloted:false)
						student_detail.push([roll_no,cgpi])
					end
				end
			end
		
			@borders=setpref(student_detail)
		else
			redirect_to current_admin
		end


	end
	def create
		student_detail=[]
		@year=params[:year]
		@hostel1=params[:hostel1]
		@hostel2=params[:hostel2]
		@floors=params[:floors]
		@rooms=params[:rooms]
		time=params[:preference]
		@starttime=DateTime.new(time["StartTime(1i)"].to_i,time["StartTime(2i)"].to_i,time["StartTime(3i)"].to_i,time["StartTime(4i)"].to_i,time["StartTime(5i)"].to_i)
		@endtime=DateTime.new(time["EndTime(1i)"].to_i,time["EndTime(2i)"].to_i,time["EndTime(3i)"].to_i,time["EndTime(4i)"].to_i,time["EndTime(5i)"].to_i)
		@starttime=@starttime-6.hours+30.minutes
		@endtime=@endtime-6.hours+30.minutes
		current_year=DateTime.now.year.to_s			#i.e "2017"
		last_two_digit=current_year[-2..-1].to_i 	#i.e 17
		if !@hostel2.nil?
			if @year=="1"
				borders=Border.where("roll_no LIKE :prefix",prefix:"#{last_two_digit-1}%")
			end
			if @year=="2"
				borders=Border.where("roll_no LIKE :prefix",prefix:"#{last_two_digit-2}%")
			end
			if @year=="3"
				borders=Border.where("roll_no LIKE :prefix",prefix:"#{last_two_digit-3}%")
			end
			if @year=="4"
				borders=Border.where("roll_no LIKE :prefix",prefix:"#{last_two_digit-4}%")
			end
			borders.each do |border|
				roll_no=border.roll_no
				cgpi=border.student_result.cgpi
				#border.update_attributes(alloted:false)
				student_detail.push([roll_no,cgpi])
			end
		
			@borders=setpref(student_detail)
			flash[:success]="Allotement scheduled year: #{@year} hotel:#{@hostel2}"
			redirect_to checklist_path(@year)
		else
			redirect_to current_admin
		end
	end


	def setdatetime
		time=params[:preference]
		@datetime=DateTime.new(time["DateTime(1i)"].to_i,time["DateTime(2i)"].to_i,time["DateTime(3i)"].to_i,time["DateTime(4i)"].to_i,time["DateTime(5i)"].to_i)
		
		preferences=["Preference1","Preference2","Preference3"]
		preferences.each do |preference|
			startdatetime=@datetime-6.hours
			preference_model=preference.constantize
			borders=preference_model.all.order('cgpi DESC')
			Array(borders).each_slice(3) do |slice|
				a=preference_model.where(id: slice.map(&:id))
				startdatetime=startdatetime+30.minutes
				a.update_all(start:startdatetime,endtime:startdatetime+30.minutes)
			end
		end
		redirect_to current_admin
	end
	private
		def setpref(student_detail)
			if @year=="1"
				Preference1.destroy_all
				student_detail.each do |s|
					Preference1.create(roll_no:s[0],cgpi:s[1])
				end
					@floors.each do |floor|
						AlloteHostel.create(preference:Preference1.new.class.name,hostel:@hostel2,floor:floor,starttime:@starttime,endtime:@endtime)
					end
					rooms=@hostel2.constantize.where(room_mo:@rooms)
					rooms.update_all(active:@year)
				return Preference3.all.order('cgpi DESC')
				
			end
			if @year=="2"
				Preference2.destroy_all
				student_detail.each do |s|
					Preference2.create(roll_no:s[0],cgpi:s[1])
				end
					@floors.each do |floor|
						AlloteHostel.create(preference:Preference2.new.class.name,hostel:@hostel2,floor:floor,starttime:@starttime,endtime:@endtime)
					end
					rooms=@hostel2.constantize.where(room_no:@rooms)
				rooms.update_all(active:@year)
				return Preference3.all.order('cgpi DESC')
				
			end
			if @year=="3"
				Preference3.destroy_all
				student_detail.each do |s|
					Preference3.create(roll_no:s[0],cgpi:s[1])
				end
				@floors.each do |floor|
					AlloteHostel.create(preference:Preference3.new.class.name,hostel:@hostel2,floor:floor,starttime:@starttime,endtime:@endtime)
					
					
				end
				rooms=@hostel2.constantize.where(room_no:@rooms)
				rooms.update_all(active:@year)
				return Preference3.all.order('cgpi DESC')
			end
			if @year=="4"
				Preference4.destroy_all
				student_detail.each do |s|
					Preference4.create(roll_no:s[0],cgpi:s[1])
				end
				@floors.each do |floor|
					AlloteHostel.create(preference:Preference4.new.class.name,hostel:@hostel2,floor:floor,starttime:@starttime,endtime:@endtime)
					
				end
				rooms=@hostel2.constantize.where(room_no:@rooms)
				rooms.update_all(active:@year)
				return Preference4.all.order('cgpi DESC')
			end
		end
end
