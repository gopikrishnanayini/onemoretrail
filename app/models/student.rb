class Student < ActiveRecord::Base
	has_many :events
	validates :name, presence: true
	validates :branch, presence: true
	validates :dob, presence: true
end
