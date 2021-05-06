require "application_system_test_case"

class BagsTest < ApplicationSystemTestCase
  setup do
    @bag = bags(:one)
  end

  test "visiting the index" do
    visit bags_url
    assert_selector "h1", text: "Bags"
  end

  test "creating a Bag" do
    visit bags_url
    click_on "New Bag"

    fill_in "Quantity", with: @bag.quantity
    fill_in "User", with: @bag.user_id
    click_on "Create Bag"

    assert_text "Bag was successfully created"
    click_on "Back"
  end

  test "updating a Bag" do
    visit bags_url
    click_on "Edit", match: :first

    fill_in "Quantity", with: @bag.quantity
    fill_in "User", with: @bag.user_id
    click_on "Update Bag"

    assert_text "Bag was successfully updated"
    click_on "Back"
  end

  test "destroying a Bag" do
    visit bags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bag was successfully destroyed"
  end
end
