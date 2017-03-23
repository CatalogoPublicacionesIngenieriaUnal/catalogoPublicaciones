require 'test_helper'

class ProfessorPublicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor_publication = professor_publications(:one)
  end

  test "should get index" do
    get professor_publications_url
    assert_response :success
  end

  test "should get new" do
    get new_professor_publication_url
    assert_response :success
  end

  test "should create professor_publication" do
    assert_difference('ProfessorPublication.count') do
      post professor_publications_url, params: { professor_publication: {  } }
    end

    assert_redirected_to professor_publication_url(ProfessorPublication.last)
  end

  test "should show professor_publication" do
    get professor_publication_url(@professor_publication)
    assert_response :success
  end

  test "should get edit" do
    get edit_professor_publication_url(@professor_publication)
    assert_response :success
  end

  test "should update professor_publication" do
    patch professor_publication_url(@professor_publication), params: { professor_publication: {  } }
    assert_redirected_to professor_publication_url(@professor_publication)
  end

  test "should destroy professor_publication" do
    assert_difference('ProfessorPublication.count', -1) do
      delete professor_publication_url(@professor_publication)
    end

    assert_redirected_to professor_publications_url
  end
end
