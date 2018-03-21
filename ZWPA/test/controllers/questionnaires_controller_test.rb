require 'test_helper'

class QuestionnairesControllerTest < ActionController::TestCase
  setup do
    @questionnaire = questionnaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionnaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post :create, questionnaire: { batteries: @questionnaire.batteries, buy_recycling_policy: @questionnaire.buy_recycling_policy, buy_recycling_policy_info: @questionnaire.buy_recycling_policy_info, cell_phones: @questionnaire.cell_phones, cfls: @questionnaire.cfls, compost_program_info: @questionnaire.compost_program_info, compost_waste_current: @questionnaire.compost_waste_current, compost_waste_past: @questionnaire.compost_waste_past, construction_debris: @questionnaire.construction_debris, corded_equipment: @questionnaire.corded_equipment, discontinued_recycling_info: @questionnaire.discontinued_recycling_info, freight_elevators: @questionnaire.freight_elevators, furniture: @questionnaire.furniture, leed_certified: @questionnaire.leed_certified, linens: @questionnaire.linens, loading_dock: @questionnaire.loading_dock, location_info: @questionnaire.location_info, management_structure: @questionnaire.management_structure, max_occupancy: @questionnaire.max_occupancy, num_floors: @questionnaire.num_floors, pallets: @questionnaire.pallets, peripherals: @questionnaire.peripherals, prc_waste_audit: @questionnaire.prc_waste_audit, recertify_leed: @questionnaire.recertify_leed, record_of_waste_vol: @questionnaire.record_of_waste_vol, recycling_mandated: @questionnaire.recycling_mandated, recycling_program: @questionnaire.recycling_program, recycling_program_info: @questionnaire.recycling_program_info, recycling_program_stream: @questionnaire.recycling_program_stream, solid_waste_containers: @questionnaire.solid_waste_containers, solid_waste_info: @questionnaire.solid_waste_info, solid_waste_storage: @questionnaire.solid_waste_storage, solid_waste_system: @questionnaire.solid_waste_system, square_footage: @questionnaire.square_footage, toner: @questionnaire.toner, trash_hauler: @questionnaire.trash_hauler, trash_hauler_contract: @questionnaire.trash_hauler_contract, trash_hauler_copy: @questionnaire.trash_hauler_copy, true_zero_waste_audit: @questionnaire.true_zero_waste_audit, tvs: @questionnaire.tvs, waste_disposal_system: @questionnaire.waste_disposal_system, waste_management_costs: @questionnaire.waste_management_costs, zero_waste_policy: @questionnaire.zero_waste_policy }
    end

    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should show questionnaire" do
    get :show, id: @questionnaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionnaire
    assert_response :success
  end

  test "should update questionnaire" do
    patch :update, id: @questionnaire, questionnaire: { batteries: @questionnaire.batteries, buy_recycling_policy: @questionnaire.buy_recycling_policy, buy_recycling_policy_info: @questionnaire.buy_recycling_policy_info, cell_phones: @questionnaire.cell_phones, cfls: @questionnaire.cfls, compost_program_info: @questionnaire.compost_program_info, compost_waste_current: @questionnaire.compost_waste_current, compost_waste_past: @questionnaire.compost_waste_past, construction_debris: @questionnaire.construction_debris, corded_equipment: @questionnaire.corded_equipment, discontinued_recycling_info: @questionnaire.discontinued_recycling_info, freight_elevators: @questionnaire.freight_elevators, furniture: @questionnaire.furniture, leed_certified: @questionnaire.leed_certified, linens: @questionnaire.linens, loading_dock: @questionnaire.loading_dock, location_info: @questionnaire.location_info, management_structure: @questionnaire.management_structure, max_occupancy: @questionnaire.max_occupancy, num_floors: @questionnaire.num_floors, pallets: @questionnaire.pallets, peripherals: @questionnaire.peripherals, prc_waste_audit: @questionnaire.prc_waste_audit, recertify_leed: @questionnaire.recertify_leed, record_of_waste_vol: @questionnaire.record_of_waste_vol, recycling_mandated: @questionnaire.recycling_mandated, recycling_program: @questionnaire.recycling_program, recycling_program_info: @questionnaire.recycling_program_info, recycling_program_stream: @questionnaire.recycling_program_stream, solid_waste_containers: @questionnaire.solid_waste_containers, solid_waste_info: @questionnaire.solid_waste_info, solid_waste_storage: @questionnaire.solid_waste_storage, solid_waste_system: @questionnaire.solid_waste_system, square_footage: @questionnaire.square_footage, toner: @questionnaire.toner, trash_hauler: @questionnaire.trash_hauler, trash_hauler_contract: @questionnaire.trash_hauler_contract, trash_hauler_copy: @questionnaire.trash_hauler_copy, true_zero_waste_audit: @questionnaire.true_zero_waste_audit, tvs: @questionnaire.tvs, waste_disposal_system: @questionnaire.waste_disposal_system, waste_management_costs: @questionnaire.waste_management_costs, zero_waste_policy: @questionnaire.zero_waste_policy }
    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete :destroy, id: @questionnaire
    end

    assert_redirected_to questionnaires_path
  end
end
