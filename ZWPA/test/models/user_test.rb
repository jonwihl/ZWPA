require 'test_helper'

class UserTest < ActiveSupport::TestCase
	should have_many(:audits)

	should validate_presence_of(:first_name)
	should validate_presence_of(:last_name)
	should validate_presence_of(:email)
	should validate_presence_of(:role)

	# Validating email...
	should allow_value("fred@fred.com").for(:email)
	should allow_value("fred@andrew.cmu.edu").for(:email)
	should allow_value("my_fred@fred.org").for(:email)
	should allow_value("fred123@fred.gov").for(:email)
	should allow_value("my.fred@fred.net").for(:email)

	should_not allow_value("fred").for(:email)
	should_not allow_value("fred@fred,com").for(:email)
	should_not allow_value("my fred@fred.com").for(:email)
	should_not allow_value("fred@fred.con").for(:email)

	def new_user(attributes = {})
	    attributes[:first_name] ||= 'Ed'
	    attributes[:last_name] ||= 'Gruberman'
	    attributes[:email] ||= 'ed@gmail.com'
	    attributes[:role] ||= 'administrator'
	    attributes[:password] ||= 'secrets1'
	    attributes[:password_confirmation] ||= attributes[:password]
	    user = User.new(attributes)
	    user.valid? # run validations
	    user
	end

	def setup
	    User.delete_all
	end

	def test_valid
    	assert new_user.valid?
  	end

	def test_require_first_name
	    assert_equal ["can't be blank"], new_user(first_name: '').errors[:first_name]
	end

	def test_require_last_name
    	assert_equal ["can't be blank"], new_user(last_name: '').errors[:last_name]
    end

  	def test_require_email
    	assert_equal ["can't be blank", "is not a valid format"], new_user(email: '').errors[:email]
    end

    def test_require_role
    	assert_equal ["can't be blank", "is not a valid role"], new_user(role: '').errors[:role]
    end

  	def test_require_password
    	assert_equal ["can't be blank"], new_user(password: '').errors[:password]
  	end

  	def test_validate_uniqueness_of_email
	    new_user(email: 'unique@prc.org').save!
	    assert_equal ["has already been taken"], new_user(email: 'unique@prc.org').errors[:email]
    end

    def test_validate_password_length
    	deny new_user(password: 'bad').valid?
  	end

  	def test_require_matching_password_confirmation
    	deny new_user(password_confirmation: 'nonmatching').valid?
    end

  	context "Creating applicants context" do
	    # create the objects I want with factories
	    setup do 
	    	create_users
	    end
	    
	    # and provide a teardown method as well
	    teardown do
	      	delete_users
	    end

	    should "show that alphabetical scope works" do 
	    	assert_equal ["Albin", "Bradley", "Rob"], User.all.alphabetical.map{ |u| u.last_name}
	    end

	    should "show that active scope works" do
	    	assert_equal ["Albin", "Bradley"], User.all.active.map{ |u| u.last_name}.sort
	    end

	    should "show that inactive scope works" do
	    	assert_equal ["Rob"], User.all.inactive.map{ |u| u.last_name}.sort
	    end

	    should "show that role scope works" do
	    	assert_equal ["Albin", "Bradley", "Rob"], User.all.role("administrator").map{ |u| u.last_name}.sort
	    end

	    should "show the proper name method works" do
	    	assert_equal "Stacy Albin", @stacy.proper_name
	    end
	end
end
