class SettingsController < ApplicationController
	def show
		@hostels=[]
		Hostel.all.each do |hostel|
			@hostels.push(hostel.hostel_name)
		end
	end

	def newhostel
		require './db/migrate/new_hostel_migration.rb'
		hostel_name=params[:hostel]["name"]
		hostel_name=hostel_name.downcase
		model_name = hostel_name.singularize.capitalize
		hostel_name=hostel_name.pluralize
		begin
    	NewHostel.create_with(hostel_name)
    	rescue ActiveRecord::StatementInvalid		#if table is already exist
    		flash[:danger]="#{hostel_name} is already exits"
    		redirect_to(setting_path) and return
    	end
    	Hostel.create(hostel_name:model_name)
    	flash[:success]="Hostel crated succesfully"
    	redirect_to(setting_path)
	end



	def import
		selected_hostel=params[:selected_hostel]
		hostel_class=selected_hostel.constantize
		begin
	  	hostel_class.import(params[:file])
	  	rescue
	  		flash[:danger]="File cant be imported please check file data or formate "
	  		redirect_to(setting_path) and return
	  	end
	  	flash[:success]="file is imported successfully"
	  	redirect_to(setting_path)
	end

	def import_student_result
		begin
		StudentResult.import(params[:file])
		rescue
	  		flash[:danger]="Result cant be imported please check file data or formate "
	  		redirect_to(setting_path) and return
	  	end
	  	flash[:success]="Result is imported successfully"
	  	redirect_to(setting_path)
	end

	def create_profile
		roll_nos=StudentResult.all.map(&:roll_no)
		@password={}
		roll_nos.each do |roll_no|
			if Border.find_by(roll_no:roll_no).nil?
				result=StudentResult.find_by(roll_no:roll_no)
				#pass=((1..9).to_a+('a'..'z').to_a+('A'..'Z').to_a).shuffle[5,15].join
				pass="1234567"
				a=Border.create(roll_no:roll_no,student_result_id:result.id,password:pass,password_confirmation:pass,hostel_id:1,hostel_type:"Temphostel")
				@password[roll_no]=pass
			end
		end
	respond_to do |format|
        format.html
        format.xlsx
     end
		
		
	end
end
