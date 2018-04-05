module Contexts
	module WasteInfos

		def create_waste_infos
			@w1 = FactoryBot.create(:waste_info, notes: "w1", area: @cob)
			@w2 = FactoryBot.create(:waste_info, category: "compost", timestamp: Date.current - 1, notes: "w2", area: @cob)
			@w3 = FactoryBot.create(:waste_info, anomaly: true, timestamp: Date.current - 2, notes: "w3")
			@w4 = FactoryBot.create(:waste_info, active: false, timestamp: Date.current - 3, notes: "w4")
		end

		def delete_waste_infos
			@w1.delete
			@w2.delete
			@w3.delete
			@w4.delete
		end
	end
end