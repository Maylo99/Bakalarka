class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]

  # GET /videos or /videos.json
  def index
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    @videos = Video.all
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
  end

  # GET /videos/1 or /videos/1.json
  def show
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    v=Video.find_by(id: params[:id])
    c = CourseRegistration.where("course_id=:course and user_id=:user", { user: session[:user_id], course: v.course_id })
    if c.empty?
      redirect_to root_path, notice: "Nie si prihláseny do kurzu"
    end
  end

  # GET /videos/new
  def new
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    @video=Video.find_by(id:params[:id])
    authorize @video
  end

  # POST /videos or /videos.json
  def create
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    @video = Video.new(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to video_url(@video), notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to video_url(@video), notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    authorize @video
    @course=Course.find_by(id: @video.course_id)
    @video.destroy

    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params

      params.require(:video).permit(:title, :description, :file, :course_id)
    end


end
