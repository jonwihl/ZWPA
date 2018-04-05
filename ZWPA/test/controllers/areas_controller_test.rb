require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest    
    setup do 
        create_areas
    end
      
    teardown do
        delete_areas
    end

    test "should get index" do
        get areas_url
        assert_response :success
        assert_not_nil assigns(:areas)
    end

    test "should get new" do
        get new_area_url
        assert_response :success
    end

    test "should create a new area" do
        assert_difference('Area.count', 1) do
            post areas_url, params: { area: { name: @cob.name, active: @cob.active } }
        end
        assert_redirected_to areas_url
      end

    test "should not create a new areas with invalid params" do
        post areas_url, params: { area: { name: nil, active: @cob.active } }
        assert_template :new
    end

    test "should show area" do
        get area_url(@cob)
        assert_equal "County Office Building", assigns(:area).name
        assert_response :success
    end

    test "should get edit" do
        get edit_area_url(@cob)
        assert_not_nil assigns(:area)
        assert_equal "County Office Building", assigns(:area).name
        assert_response :success
    end

    test "should update a area" do
        patch area_url(@cob), params: { area: { name: @cob.name, active: @cob.active } }
        assert_redirected_to area_url(@cob)
        assert_equal "County Office Building has been updated.", flash[:notice]    
    end

    test "should fail to update area with invalid params" do
        patch area_url(@cob), params: { area: { name: nil, active: @cob.active } }
        assert_template :edit
    end

    test "should destroy area" do
        assert_difference('Area.count', -1) { delete area_path(@cob) }
        assert_redirected_to areas_path
    end
end