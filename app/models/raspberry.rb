class Raspberry < ActiveRecord::Base
	validates :serial_number, uniqueness: true
	belongs_to :user
end
