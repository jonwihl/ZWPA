require 'test_helper'

class ClientTest < ActiveSupport::TestCase
	should have_many(:audits)

	should validate_presence_of(:name)
	should validate_presence_of(:street_1)
	should validate_presence_of(:city)
	should validate_presence_of(:state)
	should validate_presence_of(:zip)
	should validate_presence_of(:contact_phone)
	should validate_presence_of(:contact_email)
	should validate_presence_of(:contact_first_name)
	should validate_presence_of(:contact_last_name)

	# Validating zip...
  	should allow_value("03431").for(:zip)
  	should allow_value("15217").for(:zip)
  	should allow_value("15090").for(:zip)
  	should_not allow_value("fred").for(:zip)
  	should_not allow_value("3431").for(:zip)
  	should_not allow_value("15213-9843").for(:zip)
  	should_not allow_value("15d32").for(:zip)

  	should allow_value("1234567890").for(:contact_phone)
  	should allow_value("(123)-456-7890").for(:contact_phone)
  	should_not allow_value("123-456-PHIP").for(:contact_phone)

  	should allow_value("a@prc.org").for(:contact_email)
  	
  	context "Creating clients context" do
	    # create the objects I want with factories
	    setup do 
	      create_clients
	    end
	    
	    # and provide a teardown method as well
	    teardown do
	      delete_clients
	    end

	    should "show that alphabetical scope works" do
	    	assert_equal ["CMU", "Phipps Conservatory"], Client.all.alphabetical.map{|u| u.name}.sort
	    end

		should "show that active scope works" do
	    	assert_equal ["CMU"], Client.all.active.map{|u| u.name}.sort
	    end	 

	    should "show that inactive scope works" do
	    	assert_equal ["Phipps Conservatory"], Client.all.inactive.map{|u| u.name}.sort
	    end

	    should "show that proper name method works" do
	    	assert_equal "Larry Heimann", @cmu.proper_name
	    end   

	    should "show that proper_name_title method works" do
	    	assert_equal "Larry Heimann (IS Faculty)", @cmu.proper_name_title
	    	assert_equal "John Doe", @phipps.proper_name_title
	    end

	    should "show that proper address method works" do
	    	assert_equal "5000 Forbes Ave" + "\n" + "Pittsburgh, PA 15213", @cmu.proper_address
	    	assert_equal "Phipps Conservatory" + "\n" + "1 Schenley Drive" + "\n" + "Pittsburgh, PA 15213", @phipps.proper_address
	    end
	end
end
