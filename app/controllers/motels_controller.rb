class MotelsController < ApplicationController
  before_action :set_motel, only: %i[ show edit update destroy ]

  # GET /motels or /motels.json
  def index
    @motels =
    Motel.search(params[:query]).page(params[:page]).per(9)
  end

  # GET /motels/1 or /motels/1.json
  def show
  end

  # GET /motels/new
  def new
    @motel = Motel.new
  end

  # GET /motels/1/edit
  def edit
  end

  # POST /motels or /motels.json
  def create
    @motel = Motel.new(motel_params)

    respond_to do |format|
      if @motel.save
        format.html { redirect_to @motel, notice: "Motel was successfully created." }
        format.json { render :show, status: :created, location: @motel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @motel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motels/1 or /motels/1.json
  def update
    respond_to do |format|
      if @motel.update(motel_params)
        format.html { redirect_to @motel, notice: "Motel was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @motel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @motel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motels/1 or /motels/1.json
  def destroy
    @motel.destroy!

    respond_to do |format|
      format.html { redirect_to motels_path, notice: "Motel was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motel
      @motel = Motel.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def motel_params
      params.expect(motel: [ :name, :address, :lat, :lon, :description, :amount, :image ])
    end
end
