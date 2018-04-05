require "test_helper"

class WasteInfoTest < ActiveSupport::TestCase
	should belong_to(:area)
	should belong_to(:material_type)

	should validate_presence_of(:category)
	should validate_presence_of(:weight)
	should validate_presence_of(:timestamp)

	should allow_value(10).for(:weight)
	should allow_value(5.7).for(:weight)
	should_not allow_value(0).for(:weight)
	should_not allow_value(-6).for(:weight)

	context "Creating waste infos context" do
	    # create the objects I want with factories
	    setup do 
	    	create_areas
	      	create_waste_infos
	    end
	    
	    # and provide a teardown method as well
	    teardown do
	      delete_waste_infos
	      delete_areas
	    end

	    should "show that reverse chronological scope works" do
	    	assert_equal ["w1", "w2", "w3", "w4"], WasteInfo.all.reverse_chronological.map{ |w| w.notes }
	    end

	    should "show that active scope works" do
	    	assert_equal ["w1", "w2", "w3"], WasteInfo.all.active.map{ |w| w.notes }.sort
	    end

	    should "show that inactive scope works" do
	    	assert_equal ["w4"], WasteInfo.all.inactive.map{ |w| w.notes }.sort
	    end

	    should "show that anomalies scope works" do
	    	assert_equal ["w3"], WasteInfo.all.anomalies.map{ |w| w.notes }.sort
	    end

	    should "show that waste category scope works" do
	    	assert_equal ["w1", "w3", "w4"], WasteInfo.all.waste_category("landfill").map{ |w| w.notes }.sort
	    end

	    should "show that waste contamination scope works" do
	    	assert_equal ["w2"], WasteInfo.all.waste_contamination.map{ |w| w.notes }.sort	
	    end

	    should "show that area waste scope works" do
	    	assert_equal ["w1", "w2"], WasteInfo.all.area_waste(@cob.id).map{ |w| w.notes }.sort
	    end
	end
end
