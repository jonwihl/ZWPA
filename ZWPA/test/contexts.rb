# require needed files
require './test/sets/users'
require './test/sets/clients'

module Contexts
	# explicitly include all sets of contexts used for testing 
	include Contexts::Users
	include Contexts::Clients
end