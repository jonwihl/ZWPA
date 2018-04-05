# require needed files
require './test/sets/users'
require './test/sets/clients'
require './test/sets/audits'
require './test/sets/questionnaires'
require './test/sets/material_types'
require './test/sets/areas'
require './test/sets/waste_infos'

module Contexts
	# explicitly include all sets of contexts used for testing 
	include Contexts::Users
	include Contexts::Clients
	include Contexts::Audits
	include Contexts::Questionnaires
	include Contexts::MaterialTypes
	include Contexts::Areas
	include Contexts::WasteInfos
end