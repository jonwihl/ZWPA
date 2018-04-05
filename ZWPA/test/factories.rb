FactoryBot.define do
  	factory :waste_info do
    	category "landfill"
    	true_category "landfill"
    	weight 1.5
    	notes nil
    	anomaly false
    	timestamp "2018-04-04 21:06:51"
    	active true
    	area nil
    	material_type nil
  	end

  	factory :area do
    	name "County Office Building"
    	active true
    	audit nil
  	end
  
  	factory :material_type do
   		name "Plastic Forks"
    	category "landfill"
    	active true
  	end

	factory :user do
	    first_name "MyString"
	    last_name "MyString"
	    email "example@prc.org"
	    role "administrator"
	    password "secrets1"
	    password_confirmation "secrets1"
	    active true
	end

	factory :client do
		name "CMU"
		street_1 "5000 Forbes Ave"
		street_2 nil
		city "Pittsburgh"
		state "PA"
		zip "15213"
		contact_phone "1234567890"
		contact_email "example@andrew.cmu.edu"
		contact_title nil
		contact_first_name "John"
		contact_last_name "Doe"
		active true
	end

	factory :audit do
		name "CMU IS Department"
		audit_type "Building"
		start_date "2018-02-18 22:35:42"
		end_date nil
		active true
		user nil
		client nil
		questionnaire nil
	end

	factory :questionnaire do
	    square_footage 10000
	    max_occupancy 500
	    num_floors 3
	    management_structure "N/A"
	    waste_disposal_system "centralized"
	    solid_waste_system "owner"
	    waste_management_costs "yes"
	    loading_dock "yes"
	    freight_elevators "yes"
	    location_info "N/A"
	    trash_hauler "N/A"
	    trash_hauler_contract "no"
	    trash_hauler_copy "no"
	    record_of_waste_vol "no"
	    solid_waste_storage "N/A"
	    solid_waste_containers "dumpster"
	    solid_waste_info "N/A"
	    recycling_mandated "yes"
	    recycling_program "yes"
	    recycling_program_stream "single"
	    recycling_program_info "N/A"
	    buy_recycling_policy "no"
	    buy_recycling_policy_info "N/A"
	    discontinued_recycling_info "N/A"
	    compost_waste_current "yes"
	    compost_waste_past "no"
	    compost_program_info "N/A"
	    toner "yes"
	    cfls "yes"
	    batteries "yes"
	    peripherals "yes"
	    cell_phones "yes"
	    tvs "yes"
	    corded_equipment "yes"
	    furniture "yes"
	    linens "yes"
	    construction_debris "yes"
	    pallets "yes"
	    zero_waste_policy "yes"
	    leed_certified "yes"
	    recertify_leed "yes"
	    true_zero_waste_audit "yes"
	    prc_waste_audit "yes"
	end
end