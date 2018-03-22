require 'test_helper'

class UserTest < ActiveSupport::TestCase
	should have_many(:audits)

	should validate_presence_of(:first_name)
	should validate_presence_of(:last_name)
	should validate_presence_of(:email)
	should validate_presence_of(:role)
end
