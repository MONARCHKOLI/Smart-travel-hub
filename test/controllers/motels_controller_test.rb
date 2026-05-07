require "test_helper"

class MotelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motel = motels(:one)
  end

  test "should get index" do
    get motels_url
    assert_response :success
  end

  test "should get new" do
    get new_motel_url
    assert_response :success
  end

  test "should create motel" do
    assert_difference("Motel.count") do
      post motels_url, params: { motel: { address: @motel.address, description: @motel.description, lat: @motel.lat, lon: @motel.lon, name: @motel.name } }
    end

    assert_redirected_to motel_url(Motel.last)
  end

  test "should show motel" do
    get motel_url(@motel)
    assert_response :success
  end

  test "should get edit" do
    get edit_motel_url(@motel)
    assert_response :success
  end

  test "should update motel" do
    patch motel_url(@motel), params: { motel: { address: @motel.address, description: @motel.description, lat: @motel.lat, lon: @motel.lon, name: @motel.name } }
    assert_redirected_to motel_url(@motel)
  end

  test "should destroy motel" do
    assert_difference("Motel.count", -1) do
      delete motel_url(@motel)
    end

    assert_redirected_to motels_url
  end
end
