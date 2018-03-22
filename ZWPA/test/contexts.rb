# require needed files
require './test/sets/users'

module Contexts
	# explicitly include all sets of contexts used for testing 
	include Contexts::Users
end