require 'test_helper'

class ApprovedPublicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @approved_publication = approved_publications(:one)
  end

  test "should get index" do
    get approved_publications_url
    assert_response :success
  end

  test "should get new" do
    get new_approved_publication_url
    assert_response :success
  end

  test "should create approved_publication" do
    assert_difference('ApprovedPublication.count') do
      post approved_publications_url, params: { approved_publication: { resolution: @approved_publication.resolution, stock: @approved_publication.stock, stock_at_library: @approved_publication.stock_at_library, stock_at_store: @approved_publication.stock_at_store } }
    end

    assert_redirected_to approved_publication_url(ApprovedPublication.last)
  end

  test "should show approved_publication" do
    get approved_publication_url(@approved_publication)
    assert_response :success
  end

  test "should get edit" do
    get edit_approved_publication_url(@approved_publication)
    assert_response :success
  end

  test "should update approved_publication" do
    patch approved_publication_url(@approved_publication), params: { approved_publication: { resolution: @approved_publication.resolution, stock: @approved_publication.stock, stock_at_library: @approved_publication.stock_at_library, stock_at_store: @approved_publication.stock_at_store } }
    assert_redirected_to approved_publication_url(@approved_publication)
  end

  test "should destroy approved_publication" do
    assert_difference('ApprovedPublication.count', -1) do
      delete approved_publication_url(@approved_publication)
    end

    assert_redirected_to approved_publications_url
  end
end
