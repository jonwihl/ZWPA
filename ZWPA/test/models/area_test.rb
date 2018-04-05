require "test_helper"

class AreaTest < ActiveSupport::TestCase
	should belong_to(:audit)

	should validate_presence_of(:name)

	context "Creating areas context" do
	    # create the objects I want with factories
	    setup do 
	      create_areas
	    end
	    
	    # and provide a teardown method as well
	    teardown do
	      delete_areas
	    end

	    should "show that alphabetical scope works" do
	    	assert_equal ["County Office Building", "Hunt Library", "Porter Hall"], Area.all.alphabetical.map{ |m| m.name }
	    end

	    should "show that active scope works" do
	    	assert_equal ["County Office Building", "Porter Hall"], Area.all.active.map{ |m| m.name }.sort
	    end

	    should "show that inactive scope works" do
	    	assert_equal ["Hunt Library"], Area.all.inactive.map{ |m| m.name }.sort
	    end
	end
end
