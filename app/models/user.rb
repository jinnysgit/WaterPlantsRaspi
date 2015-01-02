class User < ActiveRecord::Base
	validates :phone_number, uniqueness: true
	has_many :raspberries
end
