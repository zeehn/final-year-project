require "application_system_test_case"

class MaidsTest < ApplicationSystemTestCase
  setup do
    @maid = maids(:one)
  end

  test "visiting the index" do
    visit maids_url
    assert_selector "h1", text: "Maids"
  end

  test "should create maid" do
    visit maids_url
    click_on "New maid"

    fill_in "Address", with: @maid.address
    fill_in "City", with: @maid.city
    fill_in "Email", with: @maid.email
    fill_in "First name", with: @maid.first_name
    fill_in "Hourly rate", with: @maid.hourly_rate
    fill_in "Last name", with: @maid.last_name
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    fill_in "State", with: @maid.state
    fill_in "Zip", with: @maid.zip
    click_on "Create Maid"

    assert_text "Maid was successfully created"
    click_on "Back"
  end

  test "should update Maid" do
    visit maid_url(@maid)
    click_on "Edit this maid", match: :first

    fill_in "Address", with: @maid.address
    fill_in "City", with: @maid.city
    fill_in "Email", with: @maid.email
    fill_in "First name", with: @maid.first_name
    fill_in "Hourly rate", with: @maid.hourly_rate
    fill_in "Last name", with: @maid.last_name
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    fill_in "State", with: @maid.state
    fill_in "Zip", with: @maid.zip
    click_on "Update Maid"

    assert_text "Maid was successfully updated"
    click_on "Back"
  end

  test "should destroy Maid" do
    visit maid_url(@maid)
    click_on "Destroy this maid", match: :first

    assert_text "Maid was successfully destroyed"
  end
end
