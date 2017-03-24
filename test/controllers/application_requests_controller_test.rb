require 'test_helper'

class ApplicationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @application_request = application_requests(:one)
  end

  test "should get index" do
    get application_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_application_request_url
    assert_response :success
  end

  test "should create application_request" do
    assert_difference('ApplicationRequest.count') do
      post application_requests_url, params: { application_request: { created_at: @application_request.created_at, updated_at: @application_request.updated_at, url: @application_request.url } }
    end

    assert_redirected_to application_request_url(ApplicationRequest.last)
  end

  test "should show application_request" do
    get application_request_url(@application_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_application_request_url(@application_request)
    assert_response :success
  end

  test "should update application_request" do
    patch application_request_url(@application_request), params: { application_request: { created_at: @application_request.created_at, updated_at: @application_request.updated_at, url: @application_request.url } }
    assert_redirected_to application_request_url(@application_request)
  end

  test "should destroy application_request" do
    assert_difference('ApplicationRequest.count', -1) do
      delete application_request_url(@application_request)
    end

    assert_redirected_to application_requests_url
  end
end
