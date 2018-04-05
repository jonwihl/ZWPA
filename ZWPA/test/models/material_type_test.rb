require "test_helper"

class MaterialTypeTest < ActiveSupport::TestCase
	should have_many(:waste_infos)

	should validate_presence_of(:name)
	should validate_presence_of(:category)

	should allow_value("landfill").for(:category)
	should allow_value("recycling").for(:category)
	should allow_value("compost").for(:category)
	should allow_value("reuse").for(:category)
	should allow_value("food recovery").for(:category)

	context "Creating material types context" do
	    # create the objects I want with factories
	    setup do 
	      create_material_types
	    end
	    
	    # and provide a teardown method as well
	    teardown do
	      delete_material_types
	    end

	    should "show that alphabetical scope works" do
	    	assert_equal ["Corn Forks", "Plastic Forks"], MaterialType.all.alphabetical.map{ |m| m.name }
	    end

	    should "show that active scope works" do
	    	assert_equal ["Corn Forks", "Plastic Forks"], MaterialType.all.active.map{ |m| m.name }.sort
	    end

	    should "show that inactive scope works" do
	    	assert_equal [], MaterialType.all.inactive.map{ |m| m.name }.sort
	    end
	end
end
