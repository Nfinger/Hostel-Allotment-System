module BordersHelper
	def is_active?(user)
		preferences=['Preference1','Preference2','Preference3',]
		preferences.each do |preference|
			preference_model=preference.constantize
			if !(temp_user=preference_model.find_by(roll_no:user.roll_no)).nil?
				if !temp_user.start.nil?
					if (temp_user.start<=DateTime.now && temp_user.endtime>=DateTime.now)
						return true
					else
						return false
					end
				else
					return false
				end
			end
		end

    end
end
