module Contexts
	module Users

		def create_users
			@teresa = FactoryBot.create(:user, first_name: "Teresa", last_name: "Bradley", email: "teresa@prc.org")
			@stacy = FactoryBot.create(:user, first_name: "Stacy", last_name: "Albin", email: "stacy@prc.org")
		end

		def delete_users
			@teresa.delete
			@stacy.delete
		end

	end
end