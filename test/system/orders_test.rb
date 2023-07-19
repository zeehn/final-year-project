require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Client", with: @order.client_id
    fill_in "Instructions", with: @order.instructions
    fill_in "Maid", with: @order.maid_id
    fill_in "Schedule date", with: @order.schedule_date
    fill_in "Time from", with: @order.time_from
    fill_in "Time to", with: @order.time_to
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Client", with: @order.client_id
    fill_in "Instructions", with: @order.instructions
    fill_in "Maid", with: @order.maid_id
    fill_in "Schedule date", with: @order.schedule_date
    fill_in "Time from", with: @order.time_from
    fill_in "Time to", with: @order.time_to
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
