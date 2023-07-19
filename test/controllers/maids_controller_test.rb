require "test_helper"

class MaidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maid = maids(:one)
  end

  test "should get index" do
    get maids_url
    assert_response :success
  end

  test "should get new" do
    get new_maid_url
    assert_response :success
  end

  test "should create maid" do
    assert_difference("Maid.count") do
      post maids_url, params: { maid: { address: @maid.address, city: @maid.city, email: @maid.email, first_name: @maid.first_name, hourly_rate: @maid.hourly_rate, last_name: @maid.last_name, password: "secret", password_confirmation: "secret", state: @maid.state, zip: @maid.zip } }
    end

    assert_redirected_to maid_url(Maid.last)
  end

  test "should show maid" do
    get maid_url(@maid)
    assert_response :success
  end

  test "should get edit" do
    get edit_maid_url(@maid)
    assert_response :success
  end

  test "should update maid" do
    patch maid_url(@maid), params: { maid: { address: @maid.address, city: @maid.city, email: @maid.email, first_name: @maid.first_name, hourly_rate: @maid.hourly_rate, last_name: @maid.last_name, password: "secret", password_confirmation: "secret", state: @maid.state, zip: @maid.zip } }
    assert_redirected_to maid_url(@maid)
  end

  test "should destroy maid" do
    assert_difference("Maid.count", -1) do
      delete maid_url(@maid)
    end

    assert_redirected_to maids_url
  end
end
