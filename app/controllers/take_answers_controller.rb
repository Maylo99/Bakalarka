class TakeAnswersController < ApplicationController
  before_action :set_take_answer, only: %i[ show edit update destroy ]

  # GET /take_answers or /take_answers.json
  def index
    @take_answers = TakeAnswer.all
  end

  # GET /take_answers/1 or /take_answers/1.json
  def show
  end

  # GET /take_answers/new
  def new
    @take_answer = TakeAnswer.new
  end

  # GET /take_answers/1/edit
  def edit
  end

  # POST /take_answers or /take_answers.json
  def create
    @take_answer = TakeAnswer.new(take_answer_params)

    respond_to do |format|
      if @take_answer.save
        format.html { redirect_to take_answer_url(@take_answer), notice: "Take answer was successfully created." }
        format.json { render :show, status: :created, location: @take_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @take_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /take_answers/1 or /take_answers/1.json
  def update
    respond_to do |format|
      if @take_answer.update(take_answer_params)
        format.html { redirect_to take_answer_url(@take_answer), notice: "Take answer was successfully updated." }
        format.json { render :show, status: :ok, location: @take_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @take_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /take_answers/1 or /take_answers/1.json
  def destroy
    @take_answer.destroy

    respond_to do |format|
      format.html { redirect_to take_answers_url, notice: "Take answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_take_answer
      @take_answer = TakeAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def take_answer_params
      params.require(:take_answer).permit(:user_answer, :take_test_id)
    end
end
