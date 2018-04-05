module Contexts
	module Users

		def create_users
			@teresa = FactoryBot.create(:user, first_name: "Teresa", last_name: "Bradley", email: "teresa@prc.org")
			@stacy = FactoryBot.create(:user, first_name: "Stacy", last_name: "Albin", email: "stacy@prc.org")
			@rob = FactoryBot.create(:user, first_name: "Bob", last_name: "Rob", email: "bob@prc.org", active: false)
		end

		def delete_users
			@teresa.delete
			@stacy.delete
			@rob.delete
		end

	end
end