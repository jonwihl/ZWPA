module Contexts
	module Clients

		def create_clients
			@phipps = FactoryBot.create(:client, name: "Phipps Conservatory", street_1: "Phipps Conservatory", street_2: "1 Schenley Drive")
			@cmu = FactoryBot.create(:client, contact_first_name: "Larry", contact_last_name: "Heimann", contact_title: "IS Faculty")
		end

		def delete_clients
			@phipps.delete
			@cmu.delete
		end

	end
end