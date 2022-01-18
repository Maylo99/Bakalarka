class ComentarsController < ApplicationController
  before_action :get_video
  before_action :set_comentar,  only: %i[ show edit update destroy ]


  # GET /comentars or /comentars.json
  def index
    @comentars = @video.comentars
  end

  # GET /comentars/1 or /comentars/1.json
  def show
  end

  # GET /comentars/new
  def new
    @comentar = @video.comentars.build
  end

  # GET /comentars/1/edit
  def edit
  end

  # POST /comentars or /comentars.json
  def create
    @comentar = @video.comentars.build(comentar_params)

    respond_to do |format|
      if @comentar.save
        format.html { redirect_to video_comentars_path(@video), notice: "Comentar was successfully created." }
        format.json { render :show, status: :created, location: @comentar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentars/1 or /comentars/1.json
  def update
    respond_to do |format|
      if @comentar.update(comentar_params)
        format.html { redirect_to video_comentar_path(@video), notice: "Comentar was successfully updated." }
        format.json { render :show, status: :ok, location: @comentar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentars/1 or /comentars/1.json
  def destroy
    @comentar.destroy

    respond_to do |format|
      format.html { redirect_to video_path(@video), notice: "Comentar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentar
      @comentar =@video.comentars.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comentar_params
      params.require(:comentar).permit(:video_id, :user_id, :text, :date)
    end

    def get_video
      @video=Video.find(params[:video_id])
    end
end
