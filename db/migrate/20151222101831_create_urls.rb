class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |u|
			u.string :long, :short
			u.integer :click_count
		end
	end
end
