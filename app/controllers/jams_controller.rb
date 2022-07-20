class JamsController < ApplicationController
  before_action :set_jam, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  # GET /jams or /jams.json
  def index
    if current_user
      @jams = current_user.jams
    else
      @jams = Jam.all
    end
  end

  # GET /jams/1 or /jams/1.json
  def show
  end

  # GET /jams/new
  def new
    @jam = Jam.new
  end

  # GET /jams/1/edit
  def edit
  end

  # POST /jams or /jams.json
  def create
    @jam = Jam.new(jam_params.merge(user: current_user))

    respond_to do |format|
      if @jam.save
        format.html { redirect_to jam_url(@jam), notice: "Jam was successfully created." }
        format.json { render :show, status: :created, location: @jam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jams/1 or /jams/1.json
  def update
    respond_to do |format|
      if @jam.update(jam_params)
        format.html { redirect_to jam_url(@jam), notice: "Jam was successfully updated." }
        format.json { render :show, status: :ok, location: @jam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jams/1 or /jams/1.json
  def destroy
    @jam.destroy

    respond_to do |format|
      format.html { redirect_to jams_url, notice: "Jam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jam
      @jam = Jam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jam_params
      params.require(:jam).permit(:name)
    end
end
