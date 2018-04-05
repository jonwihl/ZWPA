require 'test_helper'

class QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @cmu = FactoryBot.create(:client, contact_first_name: "Larry", contact_last_name: "Heimann", contact_title: "IS Faculty")
    @teresa = FactoryBot.create(:user, first_name: "Teresa", last_name: "Bradley", email: "teresa@prc.org")
    @cmu_audit = FactoryBot.create(:audit, end_date: Date.current, user: @teresa, client: @cmu)
    @questionnaire = FactoryBot.create(:questionnaire)
  end

  test "should get index" do
    get questionnaires_path
    assert_response :success
  end

  test "should get new" do
    get new_questionnaire_path(audit: @cmu_audit.id)
    assert_response :success
  end

  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post questionnaires_path, params: { questionnaire: { batteries: @questionnaire.batteries, buy_recycling_policy: @questionnaire.buy_recycling_policy, buy_recycling_policy_info: @questionnaire.buy_recycling_policy_info, cell_phones: @questionnaire.cell_phones, cfls: @questionnaire.cfls, compost_program_info: @questionnaire.compost_program_info, compost_waste_current: @questionnaire.compost_waste_current, compost_waste_past: @questionnaire.compost_waste_past, construction_debris: @questionnaire.construction_debris, corded_equipment: @questionnaire.corded_equipment, discontinued_recycling_info: @questionnaire.discontinued_recycling_info, freight_elevators: @questionnaire.freight_elevators, furniture: @questionnaire.furniture, leed_certified: @questionnaire.leed_certified, linens: @questionnaire.linens, loading_dock: @questionnaire.loading_dock, location_info: @questionnaire.location_info, management_structure: @questionnaire.management_structure, max_occupancy: @questionnaire.max_occupancy, num_floors: @questionnaire.num_floors, pallets: @questionnaire.pallets, peripherals: @questionnaire.peripherals, prc_waste_audit: @questionnaire.prc_waste_audit, recertify_leed: @questionnaire.recertify_leed, record_of_waste_vol: @questionnaire.record_of_waste_vol, recycling_mandated: @questionnaire.recycling_mandated, recycling_program: @questionnaire.recycling_program, recycling_program_info: @questionnaire.recycling_program_info, recycling_program_stream: @questionnaire.recycling_program_stream, solid_waste_containers: @questionnaire.solid_waste_containers, solid_waste_info: @questionnaire.solid_waste_info, solid_waste_storage: @questionnaire.solid_waste_storage, solid_waste_system: @questionnaire.solid_waste_system, square_footage: @questionnaire.square_footage, toner: @questionnaire.toner, trash_hauler: @questionnaire.trash_hauler, trash_hauler_contract: @questionnaire.trash_hauler_contract, trash_hauler_copy: @questionnaire.trash_hauler_copy, true_zero_waste_audit: @questionnaire.true_zero_waste_audit, tvs: @questionnaire.tvs, waste_disposal_system: @questionnaire.waste_disposal_system, waste_management_costs: @questionnaire.waste_management_costs, zero_waste_policy: @questionnaire.zero_waste_policy } }
    end

    assert_redirected_to questionnaire_path(Questionnaire.last)
  	
  	post questionnaires_path, params: { questionnaire: { buy_recycling_policy: @questionnaire.buy_recycling_policy, buy_recycling_policy_info: @questionnaire.buy_recycling_policy_info, cell_phones: @questionnaire.cell_phones, cfls: @questionnaire.cfls, compost_program_info: @questionnaire.compost_program_info, compost_waste_current: @questionnaire.compost_waste_current, compost_waste_past: @questionnaire.compost_waste_past, construction_debris: @questionnaire.construction_debris, corded_equipment: @questionnaire.corded_equipment, discontinued_recycling_info: @questionnaire.discontinued_recycling_info, freight_elevators: @questionnaire.freight_elevators, furniture: @questionnaire.furniture, leed_certified: @questionnaire.leed_certified, linens: @questionnaire.linens, loading_dock: @questionnaire.loading_dock, location_info: @questionnaire.location_info, management_structure: @questionnaire.management_structure, max_occupancy: @questionnaire.max_occupancy, num_floors: @questionnaire.num_floors, pallets: @questionnaire.pallets, peripherals: @questionnaire.peripherals, prc_waste_audit: @questionnaire.prc_waste_audit, recertify_leed: @questionnaire.recertify_leed, record_of_waste_vol: @questionnaire.record_of_waste_vol, recycling_mandated: @questionnaire.recycling_mandated, recycling_program: @questionnaire.recycling_program, recycling_program_info: @questionnaire.recycling_program_info, recycling_program_stream: @questionnaire.recycling_program_stream, solid_waste_containers: @questionnaire.solid_waste_containers, solid_waste_info: @questionnaire.solid_waste_info, solid_waste_storage: @questionnaire.solid_waste_storage, solid_waste_system: @questionnaire.solid_waste_system, square_footage: @questionnaire.square_footage, toner: @questionnaire.toner, trash_hauler: @questionnaire.trash_hauler, trash_hauler_contract: @questionnaire.trash_hauler_contract, trash_hauler_copy: @questionnaire.trash_hauler_copy, true_zero_waste_audit: @questionnaire.true_zero_waste_audit, tvs: @questionnaire.tvs, waste_disposal_system: @questionnaire.waste_disposal_system, waste_management_costs: @questionnaire.waste_management_costs, zero_waste_policy: @questionnaire.zero_waste_policy } }
    assert_template :new
  end

  test "should get edit" do
    get edit_questionnaire_path(@questionnaire)
    assert_response :success
  end

  test "should update questionnaire" do
    patch questionnaire_path(@questionnaire), params: { questionnaire: { batteries: "no", buy_recycling_policy: @questionnaire.buy_recycling_policy, buy_recycling_policy_info: @questionnaire.buy_recycling_policy_info, cell_phones: @questionnaire.cell_phones, cfls: @questionnaire.cfls, compost_program_info: @questionnaire.compost_program_info, compost_waste_current: @questionnaire.compost_waste_current, compost_waste_past: @questionnaire.compost_waste_past, construction_debris: @questionnaire.construction_debris, corded_equipment: @questionnaire.corded_equipment, discontinued_recycling_info: @questionnaire.discontinued_recycling_info, freight_elevators: @questionnaire.freight_elevators, furniture: @questionnaire.furniture, leed_certified: @questionnaire.leed_certified, linens: @questionnaire.linens, loading_dock: @questionnaire.loading_dock, location_info: @questionnaire.location_info, management_structure: @questionnaire.management_structure, max_occupancy: @questionnaire.max_occupancy, num_floors: @questionnaire.num_floors, pallets: @questionnaire.pallets, peripherals: @questionnaire.peripherals, prc_waste_audit: @questionnaire.prc_waste_audit, recertify_leed: @questionnaire.recertify_leed, record_of_waste_vol: @questionnaire.record_of_waste_vol, recycling_mandated: @questionnaire.recycling_mandated, recycling_program: @questionnaire.recycling_program, recycling_program_info: @questionnaire.recycling_program_info, recycling_program_stream: @questionnaire.recycling_program_stream, solid_waste_containers: @questionnaire.solid_waste_containers, solid_waste_info: @questionnaire.solid_waste_info, solid_waste_storage: @questionnaire.solid_waste_storage, solid_waste_system: @questionnaire.solid_waste_system, square_footage: @questionnaire.square_footage, toner: @questionnaire.toner, trash_hauler: @questionnaire.trash_hauler, trash_hauler_contract: @questionnaire.trash_hauler_contract, trash_hauler_copy: @questionnaire.trash_hauler_copy, true_zero_waste_audit: @questionnaire.true_zero_waste_audit, tvs: @questionnaire.tvs, waste_disposal_system: @questionnaire.waste_disposal_system, waste_management_costs: @questionnaire.waste_management_costs, zero_waste_policy: @questionnaire.zero_waste_policy } }
    assert_redirected_to questionnaire_path(@questionnaire)
  
    patch questionnaire_path(@questionnaire), params: { questionnaire: { batteries: "NO", buy_recycling_policy: @questionnaire.buy_recycling_policy, buy_recycling_policy_info: @questionnaire.buy_recycling_policy_info, cell_phones: @questionnaire.cell_phones, cfls: @questionnaire.cfls, compost_program_info: @questionnaire.compost_program_info, compost_waste_current: @questionnaire.compost_waste_current, compost_waste_past: @questionnaire.compost_waste_past, construction_debris: @questionnaire.construction_debris, corded_equipment: @questionnaire.corded_equipment, discontinued_recycling_info: @questionnaire.discontinued_recycling_info, freight_elevators: @questionnaire.freight_elevators, furniture: @questionnaire.furniture, leed_certified: @questionnaire.leed_certified, linens: @questionnaire.linens, loading_dock: @questionnaire.loading_dock, location_info: @questionnaire.location_info, management_structure: @questionnaire.management_structure, max_occupancy: @questionnaire.max_occupancy, num_floors: @questionnaire.num_floors, pallets: @questionnaire.pallets, peripherals: @questionnaire.peripherals, prc_waste_audit: @questionnaire.prc_waste_audit, recertify_leed: @questionnaire.recertify_leed, record_of_waste_vol: @questionnaire.record_of_waste_vol, recycling_mandated: @questionnaire.recycling_mandated, recycling_program: @questionnaire.recycling_program, recycling_program_info: @questionnaire.recycling_program_info, recycling_program_stream: @questionnaire.recycling_program_stream, solid_waste_containers: @questionnaire.solid_waste_containers, solid_waste_info: @questionnaire.solid_waste_info, solid_waste_storage: @questionnaire.solid_waste_storage, solid_waste_system: @questionnaire.solid_waste_system, square_footage: @questionnaire.square_footage, toner: @questionnaire.toner, trash_hauler: @questionnaire.trash_hauler, trash_hauler_contract: @questionnaire.trash_hauler_contract, trash_hauler_copy: @questionnaire.trash_hauler_copy, true_zero_waste_audit: @questionnaire.true_zero_waste_audit, tvs: @questionnaire.tvs, waste_disposal_system: @questionnaire.waste_disposal_system, waste_management_costs: @questionnaire.waste_management_costs, zero_waste_policy: @questionnaire.zero_waste_policy } }
    assert_template :edit
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete questionnaire_path(@questionnaire)
    end

    assert_redirected_to questionnaires_path
  end

end
