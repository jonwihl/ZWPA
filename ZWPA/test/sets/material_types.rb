module Contexts
	module MaterialTypes

		def create_material_types
			@plastic_forks = FactoryBot.create(:material_type)
			@corn_forks = FactoryBot.create(:material_type, name: "Corn Forks", category: "compost")
		end

		def delete_material_types
			@plastic_forks.delete
			@corn_forks.delete
		end
	end
end