# require 'byebug'
require 'uri'

class Url < ActiveRecord::Base
	validates :short, uniqueness: true
	validates :long, presence: true
	validates :long, format: { with: URI.regexp }

	before_create :shorten
	def shorten
		allchar = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
		splitted = allchar.split(//)
		self.short = "#{splitted.sample(6).join}"
	end
end