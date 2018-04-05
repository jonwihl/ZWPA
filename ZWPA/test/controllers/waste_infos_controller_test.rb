require 'test_helper'

class WasteInfosControllerTest < ActionDispatch::IntegrationTest    
    setup do 
        create_areas
        create_waste_infos
    end
      
    teardown do
        delete_waste_infos
        # delete_areas
    end

    test "should get index" do
        get waste_infos_url
        assert_response :success
        assert_not_nil assigns(:waste_infos)
    end

    test "should get new" do
        get new_waste_info_url
        assert_response :success
    end

    test "should create a new waste information" do
        assert_difference('WasteInfo.count', 1) do
            post waste_infos_url, params: { waste_info: { category: @w1.category, true_category: nil, weight: @w1.weight, notes: @w1.notes, anomaly: @w1.anomaly, timestamp: @w1.timestamp, active: @w1.active, area_id: @w1.area_id } }
            assert_equal assigns(:waste_info).category, assigns(:waste_info).true_category
        end
        assert_redirected_to waste_infos_url
      end

    test "should not create a new waste informations with invalid params" do
        post waste_infos_url, params: { waste_info: { category: nil, true_category: @w1.true_category, weight: @w1.weight, notes: @w1.notes, anomaly: @w1.anomaly, timestamp: @w1.timestamp, active: @w1.active, area_id: @w1.area_id } }
        assert_template :new
    end


    test "should show waste_info" do
        get waste_info_url(@w1)
        assert_equal "landfill", assigns(:waste_info).category
        assert_response :success
    end

    test "should get edit" do
        get edit_waste_info_url(@w1)
        assert_not_nil assigns(:waste_info)
        assert_equal "landfill", assigns(:waste_info).category
        assert_response :success
    end

    test "should update a waste_info" do
        patch waste_info_url(@w1), params: { waste_info: { category: "compost", true_category: nil, weight: @w1.weight, notes: @w1.notes, anomaly: @w1.anomaly, timestamp: @w1.timestamp, active: @w1.active, area_id: @w1.area_id } }
        assert_redirected_to waste_info_url(@w1)
        assert_equal "The waste information has been updated.", flash[:notice]    
    end

    test "should fail to update waste_info with invalid params" do
        patch waste_info_url(@w1), params: { waste_info: { category: nil, true_category: @w1.true_category, weight: @w1.weight, notes: @w1.notes, anomaly: @w1.anomaly, timestamp: @w1.timestamp, active: @w1.active, area_id: @w1.area_id } }
        assert_template :edit
    end

    test "should destroy waste_info" do
        assert_difference('WasteInfo.count', -1) { delete waste_info_path(@w1) }
        assert_redirected_to waste_infos_path
    end
end