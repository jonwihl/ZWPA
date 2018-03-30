module Contexts
	module Questionnaires

		def create_questionnaires
			@questionnaire = FactoryBot.create(:questionnaire)
		end

		def delete_questionnaires
			@questionnaire.delete
		end
	end
end