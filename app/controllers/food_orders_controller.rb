class FoodOrdersController < ApplicationController
  before_action :set_food_order, only: %i[ show edit update destroy ]

  # GET /food_orders or /food_orders.json
  def index
    @food_orders = FoodOrder.all
  end

  # GET /food_orders/1 or /food_orders/1.json
  def show
  end

  # GET /food_orders/new
  def new
    @food_order = FoodOrder.new
  end

  # GET /food_orders/1/edit
  def edit
  end

  # POST /food_orders or /food_orders.json
  def create
    @food_order = FoodOrder.new(food_order_params)

    respond_to do |format|
      if @food_order.save
        format.html { redirect_to @food_order, notice: "Food order was successfully created." }
        format.json { render :show, status: :created, location: @food_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_orders/1 or /food_orders/1.json
  def update
    respond_to do |format|
      if @food_order.update(food_order_params)
        format.html { redirect_to @food_order, notice: "Food order was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @food_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_orders/1 or /food_orders/1.json
  def destroy
    @food_order.destroy!

    respond_to do |format|
      format.html { redirect_to food_orders_path, notice: "Food order was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_order
      @food_order = FoodOrder.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def food_order_params
      params.expect(food_order: [ :booking_id, :food_item_id, :quantity, :status, :scheduled_ready_time ])
    end
end
