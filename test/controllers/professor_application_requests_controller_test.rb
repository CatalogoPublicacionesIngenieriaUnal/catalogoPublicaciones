require 'test_helper'

class ProfessorApplicationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor_application_request = professor_application_requests(:one)
  end

  test "should get index" do
    get professor_application_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_professor_application_request_url
    assert_response :success
  end

  test "should create professor_application_request" do
    assert_difference('ProfessorApplicationRequest.count') do
      post professor_application_requests_url, params: { professor_application_request: {  } }
    end

    assert_redirected_to professor_application_request_url(ProfessorApplicationRequest.last)
  end

  test "should show professor_application_request" do
    get professor_application_request_url(@professor_application_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_professor_application_request_url(@professor_application_request)
    assert_response :success
  end

  test "should update professor_application_request" do
    patch professor_application_request_url(@professor_application_request), params: { professor_application_request: {  } }
    assert_redirected_to professor_application_request_url(@professor_application_request)
  end

  test "should destroy professor_application_request" do
    assert_difference('ProfessorApplicationRequest.count', -1) do
      delete professor_application_request_url(@professor_application_request)
    end

    assert_redirected_to professor_application_requests_url
  end
end
