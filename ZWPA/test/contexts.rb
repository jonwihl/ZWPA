# require needed files
require './test/sets/users'
require './test/sets/clients'
require './test/sets/audits'

module Contexts
	# explicitly include all sets of contexts used for testing 
	include Contexts::Users
	include Contexts::Clients
	include Contexts::Audits
end