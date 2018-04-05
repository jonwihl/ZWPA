module Contexts
	module Areas
		def create_areas
			@cob = FactoryBot.create(:area)
			@porter = FactoryBot.create(:area, name: "Porter Hall", end_date: nil, status: "in progress")
			@hunt = FactoryBot.create(:area, name: "Hunt Library", active: false)
		end

		def delete_areas
			@cob.delete
			@porter.delete
			@hunt.delete
		end
	end
end