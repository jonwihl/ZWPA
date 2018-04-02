require 'test_helper'

class AuditTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:client)
	should belong_to(:questionnaire)

	should validate_presence_of(:name)
	should validate_presence_of(:audit_type)
	should validate_presence_of(:start_date)

	context "Creating audits context" do
	    # create the objects I want with factories
	    setup do 
	    	create_users
	      	create_clients
	      	create_audits
	    end
	    
	    # and provide a teardown method as well
	    teardown do
	    	delete_audits
	      	delete_clients
	      	delete_users
	    end

	    should "show that alphabetical scope works" do
	    	assert_equal ["CMU IS Department", "Phipps Conservatory Garden"], Audit.all.alphabetical.map{|u| u.name}.sort
	    end

	    should "show that active scope works" do
	    	assert_equal ["CMU IS Department", "Phipps Conservatory Garden"], Audit.all.active.map{|u| u.name}.sort
	    end

	    should "show that chronological scope works" do
	    	assert_equal ["CMU IS Department", "Phipps Conservatory Garden"], Audit.all.chronological.map{|u| u.name}.sort
	    end

	    should "show that in_progress scope works" do
	    	assert_equal ["Phipps Conservatory Garden"], Audit.all.in_progress.map{|u| u.name}.sort
	    end

	    should "show that user_audits scope works" do
	    	assert_equal ["Phipps Conservatory Garden"], Audit.all.user_audits(@stacy.id).map{|u| u.name}.sort
	    	assert_equal ["CMU IS Department"], Audit.all.user_audits(@teresa.id).map{|u| u.name}.sort
	    end

	    should "show that client_audits scope works" do
	    	assert_equal ["Phipps Conservatory Garden"], Audit.all.client_audits(@phipps.id).map{|u| u.name}.sort
	    	assert_equal ["CMU IS Department"], Audit.all.client_audits(@cmu.id).map{|u| u.name}.sort
	    end

	    should "show that audit_type scope works" do
	    	assert_equal ["CMU IS Department", "Phipps Conservatory Garden"], Audit.all.type("Building").map{|u| u.name}.sort
	    end
	end
end
