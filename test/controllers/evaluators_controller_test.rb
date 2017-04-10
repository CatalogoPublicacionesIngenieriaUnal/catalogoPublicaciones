require 'test_helper'

class EvaluatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evaluator = evaluators(:one)
  end

  test "should get index" do
    get evaluators_url
    assert_response :success
  end

  test "should get new" do
    get new_evaluator_url
    assert_response :success
  end

  test "should create evaluator" do
    assert_difference('Evaluator.count') do
      post evaluators_url, params: { evaluator: { code: @evaluator.code, email: @evaluator.email, first_name: @evaluator.first_name, last_name: @evaluator.last_name, username: @evaluator.username } }
    end

    assert_redirected_to evaluator_url(Evaluator.last)
  end

  test "should show evaluator" do
    get evaluator_url(@evaluator)
    assert_response :success
  end

  test "should get edit" do
    get edit_evaluator_url(@evaluator)
    assert_response :success
  end

  test "should update evaluator" do
    patch evaluator_url(@evaluator), params: { evaluator: { code: @evaluator.code, email: @evaluator.email, first_name: @evaluator.first_name, last_name: @evaluator.last_name, username: @evaluator.username } }
    assert_redirected_to evaluator_url(@evaluator)
  end

  test "should destroy evaluator" do
    assert_difference('Evaluator.count', -1) do
      delete evaluator_url(@evaluator)
    end

    assert_redirected_to evaluators_url
  end
end
