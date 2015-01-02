class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	end

	def show
		if	User.find_by(phone_number: params[:phone]).nil?
			redirect_to root_path
		else
			@user = User.find_by(phone_number: params[:phone])
			@raspberries = @user.raspberries
			respond_to do |format|
				format.xml
			end
		end
	end

	# Interface for create action
	def new
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

	# Interface for destroy action
	def delete
	end

	def destroy
		user = User.find_by(phone_number: params[:phone_number])
		if user.present?
			raspberry = user.raspberries.find_by(serial_number: params[:serial_number])
			if raspberry.present?
				raspberry.destroy
				redirect_to delete_path
			else
				redirect_to root_path
			end
		else
			redirect_to root_path
		end
	end
end