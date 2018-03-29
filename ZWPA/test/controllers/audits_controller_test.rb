require 'test_helper'

class AuditsControllerTest < ActionDispatch::IntegrationTest
  setup do
  	@cmu = FactoryBot.create(:client, contact_first_name: "Larry", contact_last_name: "Heimann")
  	@teresa = FactoryBot.create(:user, first_name: "Teresa", last_name: "Bradley", email: "teresa@prc.org")
    @audit = FactoryBot.create(:audit, end_date: Date.current, user: @teresa, client: @cmu)
  end

  test "should get index" do
    get audits_path
    assert_response :success
  end

  test "should get new" do
    get new_audit_path
    assert_response :success
  end

  test "should create audit" do
    assert_difference('Audit.count') do
      post audits_path, params: { audit: { active: @audit.active, end_date: @audit.end_date, name: @audit.name, user: @audit.user, client: @audit.client, start_date: @audit.start_date, audit_type: @audit.audit_type } }
    end

    assert_redirected_to audit_path(Audit.last)

    post audits_path, params: { audit: { active: @audit.active, end_date: @audit.end_date, name: nil, user: @audit.user, client: @audit.client, start_date: @audit.start_date, audit_type: @audit.audit_type } }
    assert_template :new
  end

  test "should get edit" do
    get edit_audit_path(@audit)
    assert_response :success
  end

  test "should update audit" do
    patch audit_path(@audit), params: { audit: { active: @audit.active, end_date: @audit.end_date, name: @audit.name, user: @audit.user, client: @audit.client, start_date: @audit.start_date, audit_type: @audit.audit_type } }
    assert_redirected_to audit_path(@audit)

    patch audit_path(@audit), params: { audit: { active: @audit.active, end_date: @audit.end_date, name: nil, user: @audit.user, client: @audit.client, start_date: @audit.start_date, audit_type: @audit.audit_type } }
    assert_template :edit
  end

  test "should destroy audit" do
    assert_difference('Audit.count', -1) do
      delete audit_path(@audit)
    end

    assert_redirected_to audits_path
  end
end
