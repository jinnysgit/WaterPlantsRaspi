xml.instruct!
xml.user do
	xml.phone @user.phone_number
	xml.total @raspberries.count
	@raspberries.each do |raspberry|
		xml.raspberry do
			xml.id raspberry.id
			xml.serial raspberry.serial_number
			xml.temperature raspberry.temperature
			xml.humidity raspberry.humidity
			xml.moisture raspberry.moisture
		end
	end
end