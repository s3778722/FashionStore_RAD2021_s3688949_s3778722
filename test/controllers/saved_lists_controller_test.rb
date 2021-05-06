require 'test_helper'

class SavedListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_list = saved_lists(:one)
  end

  test "should get index" do
    get saved_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_list_url
    assert_response :success
  end

  test "should create saved_list" do
    assert_difference('SavedList.count') do
      post saved_lists_url, params: { saved_list: { user_id: @saved_list.user_id } }
    end

    assert_redirected_to saved_list_url(SavedList.last)
  end

  test "should show saved_list" do
    get saved_list_url(@saved_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_list_url(@saved_list)
    assert_response :success
  end

  test "should update saved_list" do
    patch saved_list_url(@saved_list), params: { saved_list: { user_id: @saved_list.user_id } }
    assert_redirected_to saved_list_url(@saved_list)
  end

  test "should destroy saved_list" do
    assert_difference('SavedList.count', -1) do
      delete saved_list_url(@saved_list)
    end

    assert_redirected_to saved_lists_url
  end
end
