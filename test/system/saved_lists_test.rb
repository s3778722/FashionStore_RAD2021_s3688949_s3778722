require "application_system_test_case"

class SavedListsTest < ApplicationSystemTestCase
  setup do
    @saved_list = saved_lists(:one)
  end

  test "visiting the index" do
    visit saved_lists_url
    assert_selector "h1", text: "Saved Lists"
  end

  test "creating a Saved list" do
    visit saved_lists_url
    click_on "New Saved List"

    fill_in "User", with: @saved_list.user_id
    click_on "Create Saved list"

    assert_text "Saved list was successfully created"
    click_on "Back"
  end

  test "updating a Saved list" do
    visit saved_lists_url
    click_on "Edit", match: :first

    fill_in "User", with: @saved_list.user_id
    click_on "Update Saved list"

    assert_text "Saved list was successfully updated"
    click_on "Back"
  end

  test "destroying a Saved list" do
    visit saved_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saved list was successfully destroyed"
  end
end
