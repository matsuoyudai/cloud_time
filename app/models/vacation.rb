class Vacation < ApplicationRecord
	belongs_to :apply
	validates :name, presence: true
end
