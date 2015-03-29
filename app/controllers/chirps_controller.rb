class ChirpsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :set_chirp, only: [:show, :edit, :update, :destroy]

  # GET /chirps
  def index
    # instance variable - means that this is data associated with this controller instance
    # at sign is v important b/c of this!!!
    @chirps = Chirp.all 
  end

  # GET /chirps/1
  def show
  end

  # GET /chirps/new
  def new
    @chirp = Chirp.new
  end

  # GET /chirps/1/edit
  def edit
  end

  # POST /chirps
  def create
    @chirp = Chirp.new(chirp_params)

    if @chirp.save
      redirect_to @chirp, notice: 'Chirp was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /chirps/1
  def update
    if @chirp.update(chirp_params)
      redirect_to @chirp, notice: 'Chirp was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chirps/1
  def destroy
    @chirp.destroy
    redirect_to chirps_url, notice: 'Chirp was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chirp
      @chirp = Chirp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chirp_params
      params.require(:chirp).permit(:body, :user_id)
    end
end
