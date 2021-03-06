require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
	should have_many(:audits)

	# should validate_presence_of(:square_footage)
	# should validate_presence_of(:max_occupancy)
	# should validate_presence_of(:num_floors)
	# should validate_presence_of(:management_structure)
	# should validate_presence_of(:waste_disposal_system)
	# should validate_presence_of(:solid_waste_system)
	# should validate_presence_of(:waste_management_costs)
	# should validate_presence_of(:loading_dock)
	# should validate_presence_of(:freight_elevators)
	# should validate_presence_of(:location_info)
	# should validate_presence_of(:trash_hauler)
	# should validate_presence_of(:trash_hauler_contract)
	# should validate_presence_of(:trash_hauler_copy)
	# should validate_presence_of(:record_of_waste_vol)
	# should validate_presence_of(:solid_waste_storage)
	# should validate_presence_of(:solid_waste_containers)
	# should validate_presence_of(:solid_waste_info)
	# should validate_presence_of(:recycling_mandated)
	# should validate_presence_of(:recycling_program)
	# should validate_presence_of(:recycling_program_stream)
	# should validate_presence_of(:recycling_program_info)
	# should validate_presence_of(:buy_recycling_policy)
	# should validate_presence_of(:buy_recycling_policy_info)
	# should validate_presence_of(:discontinued_recycling_info)
	# should validate_presence_of(:compost_waste_current)
	# should validate_presence_of(:compost_waste_past)
	# should validate_presence_of(:compost_program_info)
	# should validate_presence_of(:toner)
	# should validate_presence_of(:cfls)
	# should validate_presence_of(:batteries)
	# should validate_presence_of(:peripherals)
	# should validate_presence_of(:cell_phones)
	# should validate_presence_of(:tvs)
	# should validate_presence_of(:corded_equipment)
	# should validate_presence_of(:furniture)
	# should validate_presence_of(:linens)
	# should validate_presence_of(:construction_debris)
	# should validate_presence_of(:pallets)
	# should validate_presence_of(:zero_waste_policy)
	# should validate_presence_of(:leed_certified)
	# should validate_presence_of(:recertify_leed)
	# should validate_presence_of(:true_zero_waste_audit)
	# should validate_presence_of(:prc_waste_audit)
    
	should allow_value(500.7).for(:square_footage)
	should allow_value(100).for(:square_footage)
	should_not allow_value(0).for(:square_footage)

	should allow_value(500).for(:max_occupancy)
	should_not allow_value(100.7).for(:max_occupancy)
	should_not allow_value(0).for(:max_occupancy)

	should allow_value(5).for(:num_floors)
	should_not allow_value(1.7).for(:num_floors)
	should_not allow_value(0).for(:num_floors)

	should allow_value("centralized").for(:waste_disposal_system)
	should allow_value("tenant").for(:waste_disposal_system)
	should_not allow_value("yes").for(:waste_disposal_system)

	should allow_value("owner").for(:solid_waste_system)
	should allow_value("management co").for(:solid_waste_system)
	should allow_value("tenants").for(:solid_waste_system)
	should_not allow_value("yes").for(:solid_waste_system)

	should allow_value("yes").for(:waste_management_costs)
	should allow_value("no").for(:waste_management_costs)
	should allow_value("dk").for(:waste_management_costs)
	should_not allow_value("Yes").for(:waste_management_costs)

	should allow_value("yes").for(:loading_dock)
	should allow_value("no").for(:loading_dock)
	should allow_value("dk").for(:loading_dock)
	should_not allow_value("Yes").for(:loading_dock)

	should allow_value("yes").for(:freight_elevators)
	should allow_value("no").for(:freight_elevators)
	should allow_value("dk").for(:freight_elevators)
	should_not allow_value("Yes").for(:freight_elevators)

	should allow_value("yes").for(:trash_hauler_contract)
	should allow_value("no").for(:trash_hauler_contract)
	should allow_value("dk").for(:trash_hauler_contract)
	should_not allow_value("Yes").for(:trash_hauler_contract)

	should allow_value("yes").for(:trash_hauler_copy)
	should allow_value("no").for(:trash_hauler_copy)
	should allow_value("dk").for(:trash_hauler_copy)
	should_not allow_value("Yes").for(:trash_hauler_copy)

	should allow_value("yes").for(:record_of_waste_vol)
	should allow_value("no").for(:record_of_waste_vol)
	should allow_value("dk").for(:record_of_waste_vol)
	should_not allow_value("Yes").for(:record_of_waste_vol)

	should allow_value("yes").for(:recycling_mandated)
	should allow_value("no").for(:recycling_mandated)
	should allow_value("dk").for(:recycling_mandated)
	should_not allow_value("Yes").for(:recycling_mandated)

	should allow_value("yes").for(:recycling_program)
	should allow_value("no").for(:recycling_program)
	should allow_value("dk").for(:recycling_program)
	should_not allow_value("Yes").for(:recycling_program)

	should allow_value("single").for(:recycling_program_stream)
	should allow_value("dual").for(:recycling_program_stream)
	should_not allow_value("dk").for(:recycling_program_stream)

	should allow_value("yes").for(:buy_recycling_policy)
	should allow_value("no").for(:buy_recycling_policy)
	should allow_value("dk").for(:buy_recycling_policy)
	should_not allow_value("Yes").for(:buy_recycling_policy)

	should allow_value("yes").for(:compost_waste_current)
	should allow_value("no").for(:compost_waste_current)
	should allow_value("dk").for(:compost_waste_current)
	should_not allow_value("Yes").for(:compost_waste_current)

	should allow_value("yes").for(:compost_waste_past)
	should allow_value("no").for(:compost_waste_past)
	should allow_value("dk").for(:compost_waste_past)
	should_not allow_value("Yes").for(:compost_waste_past)

	should allow_value("yes").for(:toner)
	should allow_value("no").for(:toner)
	should allow_value("dk").for(:toner)
	should_not allow_value("Yes").for(:toner)

	should allow_value("yes").for(:cfls)
	should allow_value("no").for(:cfls)
	should allow_value("dk").for(:cfls)
	should_not allow_value("Yes").for(:cfls)

	should allow_value("yes").for(:batteries)
	should allow_value("no").for(:batteries)
	should allow_value("dk").for(:batteries)
	should_not allow_value("Yes").for(:batteries)

	should allow_value("yes").for(:peripherals)
	should allow_value("no").for(:peripherals)
	should allow_value("dk").for(:peripherals)
	should_not allow_value("Yes").for(:peripherals)

	should allow_value("yes").for(:cell_phones)
	should allow_value("no").for(:cell_phones)
	should allow_value("dk").for(:cell_phones)
	should_not allow_value("Yes").for(:cell_phones)

	should allow_value("yes").for(:tvs)
	should allow_value("no").for(:tvs)
	should allow_value("dk").for(:tvs)
	should_not allow_value("Yes").for(:tvs)

	should allow_value("yes").for(:corded_equipment)
	should allow_value("no").for(:corded_equipment)
	should allow_value("dk").for(:corded_equipment)
	should_not allow_value("Yes").for(:corded_equipment)

	should allow_value("yes").for(:furniture)
	should allow_value("no").for(:furniture)
	should allow_value("dk").for(:furniture)
	should_not allow_value("Yes").for(:furniture)

	should allow_value("yes").for(:linens)
	should allow_value("no").for(:linens)
	should allow_value("dk").for(:linens)
	should_not allow_value("Yes").for(:linens)

	should allow_value("yes").for(:construction_debris)
	should allow_value("no").for(:construction_debris)
	should allow_value("dk").for(:construction_debris)
	should_not allow_value("Yes").for(:construction_debris)

	should allow_value("yes").for(:pallets)
	should allow_value("no").for(:pallets)
	should allow_value("dk").for(:pallets)
	should_not allow_value("Yes").for(:pallets)

	should allow_value("yes").for(:zero_waste_policy)
	should allow_value("no").for(:zero_waste_policy)
	should allow_value("dk").for(:zero_waste_policy)
	should_not allow_value("Yes").for(:zero_waste_policy)

	should allow_value("yes").for(:leed_certified)
	should allow_value("no").for(:leed_certified)
	should allow_value("dk").for(:leed_certified)
	should_not allow_value("Yes").for(:leed_certified)

	should allow_value("yes").for(:recertify_leed)
	should allow_value("no").for(:recertify_leed)
	should allow_value("dk").for(:recertify_leed)
	should_not allow_value("Yes").for(:recertify_leed)

	should allow_value("yes").for(:true_zero_waste_audit)
	should allow_value("no").for(:true_zero_waste_audit)
	should allow_value("dk").for(:true_zero_waste_audit)
	should_not allow_value("Yes").for(:true_zero_waste_audit)

	should allow_value("yes").for(:prc_waste_audit)
	should allow_value("no").for(:prc_waste_audit)
	should allow_value("dk").for(:prc_waste_audit)
	should_not allow_value("Yes").for(:prc_waste_audit) 
end
