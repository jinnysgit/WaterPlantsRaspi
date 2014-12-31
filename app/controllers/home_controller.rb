class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	end

	def create
		if User.find_by(phone_number: params[:phone_number]).nil?
			a = User.new
			a.phone_number = params[:phone_number]
			a.save
		else
			a = User.find_by(phone_number: params[:phone_number])
		end

		if Raspberry.find_by(serial_number: params[:serial_number]).nil?
			b = Raspberry.new
			b.user_id = a.id
			b.serial_number = params[:serial_number]
			b.save
		end

		redirect_to new_home_path
	end

	def update
	end

	def new
	end
end
