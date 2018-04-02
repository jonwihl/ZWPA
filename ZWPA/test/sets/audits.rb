module Contexts
	module Audits

		def create_audits
			@phipps_audit = FactoryBot.create(:audit, start_date: Date.current, name: "Phipps Conservatory Garden", user: @stacy, client: @phipps)
			@cmu_audit = FactoryBot.create(:audit, end_date: Date.current, user: @teresa, client: @cmu)
		end

		def delete_audits
			@phipps_audit.delete
			@cmu_audit.delete
		end

	end
end