require 'test_helper'

class AttatchmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attatchment = attatchments(:one)
  end

  test "should get index" do
    get attatchments_url
    assert_response :success
  end

  test "should get new" do
    get new_attatchment_url
    assert_response :success
  end

  test "should create attatchment" do
    assert_difference('Attatchment.count') do
      post attatchments_url, params: { attatchment: { category: @attatchment.category, url: @attatchment.url } }
    end

    assert_redirected_to attatchment_url(Attatchment.last)
  end

  test "should show attatchment" do
    get attatchment_url(@attatchment)
    assert_response :success
  end

  test "should get edit" do
    get edit_attatchment_url(@attatchment)
    assert_response :success
  end

  test "should update attatchment" do
    patch attatchment_url(@attatchment), params: { attatchment: { category: @attatchment.category, url: @attatchment.url } }
    assert_redirected_to attatchment_url(@attatchment)
  end

  test "should destroy attatchment" do
    assert_difference('Attatchment.count', -1) do
      delete attatchment_url(@attatchment)
    end

    assert_redirected_to attatchments_url
  end
end
