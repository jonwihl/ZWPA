module Contexts
	module Clients

		def create_clients
			@phipps = FactoryBot.create(:client, name: "Phipps Conservatory")
			@cmu = FactoryBot.create(:client, contact_first_name: "Larry", contact_last_name: "Heimann")
		end

		def delete_clients
			@phipps.delete
			@cmu.delete
		end

	end
end