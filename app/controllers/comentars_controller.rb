class ComentarsController < ApplicationController
  # before_action :get_video
  before_action :set_comentar,  only: %i[edit,update]
  def create
    user=current_user
    @comentar=user.comentars.new(comentar_params)
    @video=Video.find_by(id: params[:video_id])
    if @comentar.save
      redirect_to video_path(@video)
      else
        flash[:notice]=@comentar.errors.full_messages.to_sentence
    end
  end

  def destroy
    @comentar=Comentar.find_by(id: params[:id])
    @video=Video.find_by(id: @comentar.video_id)
    @comentar.destroy
    respond_to do |format|
      format.html { redirect_to video_path(@video), notice: "Komentár bol úspešne zmazaný" }
      format.json { head :no_content }
    end
  end
  def edit
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    @comentar=Comentar.find_by(id: params[:id])
    @video=Video.find_by(id: @comentar.video_id)
  end

  def update
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
      @comentar=Comentar.find_by(id: params[:id])
      @video=Video.find_by(id: @comentar.video_id)
      respond_to do |format|
        if @comentar.update(text: params[:text])
          format.html { redirect_to video_path(@video), notice: "Comentar was successfully updated." }
          format.json { render :show, status: :ok, location: @comentar }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @comentar.errors, status: :unprocessable_entity }
        end
      end
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentar
      @comentar =@video.comentars.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #  # .require(:comentars).
    def comentar_params
      params.
        permit(:text,:video_id)
    end

    def get_video
      @video=Video.find(params[:video_id])
    end
end





#
#
# # GET /comentars or /comentars.json
# def index
#   @comentars = @video.comentars
# end
#
# # GET /comentars/1 or /comentars/1.json
# def show
# end
#
# # GET /comentars/new
# def new
#   @comentar = @video.comentars.build
# end
#
# # GET /comentars/1/edit

#
# # POST /comentars or /comentars.json
# def create
#   @comentar = @video.comentars.build(comentar_params)
#
#   respond_to do |format|
#     if @comentar.save
#       format.html { redirect_to video_comentars_path(@video), notice: "Comentar was successfully created." }
#       format.json { render :show, status: :created, location: @comentar }
#     else
#       format.html { render :new, status: :unprocessable_entity }
#       format.json { render json: @comentar.errors, status: :unprocessable_entity }
#     end
#   end
# end
#
# # PATCH/PUT /comentars/1 or /comentars/1.json
#
#
# # DELETE /comentars/1 or /comentars/1.json
# def destroy
#   @comentar.destroy
#
#   respond_to do |format|
#     format.html { redirect_to video_path(@video), notice: "Comentar was successfully destroyed." }
#     format.json { head :no_content }
#   end
# end

