require "test_helper"

class FoodOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_order = food_orders(:one)
  end

  test "should get index" do
    get food_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_food_order_url
    assert_response :success
  end

  test "should create food_order" do
    assert_difference("FoodOrder.count") do
      post food_orders_url, params: { food_order: { booking_id: @food_order.booking_id, food_item_id: @food_order.food_item_id, quantity: @food_order.quantity, scheduled_ready_time: @food_order.scheduled_ready_time, status: @food_order.status } }
    end

    assert_redirected_to food_order_url(FoodOrder.last)
  end

  test "should show food_order" do
    get food_order_url(@food_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_order_url(@food_order)
    assert_response :success
  end

  test "should update food_order" do
    patch food_order_url(@food_order), params: { food_order: { booking_id: @food_order.booking_id, food_item_id: @food_order.food_item_id, quantity: @food_order.quantity, scheduled_ready_time: @food_order.scheduled_ready_time, status: @food_order.status } }
    assert_redirected_to food_order_url(@food_order)
  end

  test "should destroy food_order" do
    assert_difference("FoodOrder.count", -1) do
      delete food_order_url(@food_order)
    end

    assert_redirected_to food_orders_url
  end
end
