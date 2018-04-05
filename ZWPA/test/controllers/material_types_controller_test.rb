require 'test_helper'

class MaterialTypesControllerTest < ActionDispatch::IntegrationTest    
    setup do 
        create_material_types
    end
      
    teardown do
        delete_material_types
    end

    test "should get index" do
        get material_types_url
        assert_response :success
        assert_not_nil assigns(:material_types)
    end

    test "should get new" do
        get new_material_type_url
        assert_response :success
    end

    test "should create a new material type" do
        assert_difference('MaterialType.count', 1) do
            post material_types_url, params: { material_type: { name: @corn_forks.name, category: @corn_forks.category, active: @corn_forks.active } }
        end
        assert_redirected_to material_types_url
      end

    test "should not create a new material types with invalid params" do
        post material_types_url, params: { material_type: { name: @corn_forks.name, category: "category", active: @corn_forks.active } }
        assert_template :new
    end


    test "should show material_type" do
        get material_type_url(@corn_forks)
        assert_equal "Corn Forks", assigns(:material_type).name
        assert_response :success
    end

    test "should get edit" do
        get edit_material_type_url(@corn_forks)
        assert_not_nil assigns(:material_type)
        assert_equal "Corn Forks", assigns(:material_type).name
        assert_response :success
    end

    test "should update a material_type" do
        patch material_type_url(@corn_forks), params: { material_type: { name: @corn_forks.name, category: "recycling", active: @corn_forks.active } }
        assert_redirected_to material_type_url(@corn_forks)
        assert_equal "Corn Forks has been updated.", flash[:notice]    
    end

    test "should fail to update material_type with invalid params" do
        patch material_type_url(@corn_forks), params: { material_type: { name: @corn_forks.name, category: nil, active: @corn_forks.active } }
        assert_template :edit
    end

    test "should destroy material_type" do
        assert_difference('MaterialType.count', -1) { delete material_type_path(@corn_forks) }
        assert_redirected_to material_types_path
    end
end