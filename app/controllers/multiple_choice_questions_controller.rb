class MultipleChoiceQuestionsController < ApplicationController
  before_action :set_multiple_choice_question, only: %i[ show edit update destroy ]

  # GET /multiple_choice_questions or /multiple_choice_questions.json
  def index
    @multiple_choice_questions = MultipleChoiceQuestion.all
  end

  # GET /multiple_choice_questions/1 or /multiple_choice_questions/1.json
  def show
  end

  # GET /multiple_choice_questions/new
  def new
    @multiple_choice_question = MultipleChoiceQuestion.new
  end

  # GET /multiple_choice_questions/1/edit
  def edit
  end

  # POST /multiple_choice_questions or /multiple_choice_questions.json
  def create
    @multiple_choice_question = MultipleChoiceQuestion.new(multiple_choice_question_params)

    respond_to do |format|
      if @multiple_choice_question.save
        format.html { redirect_to multiple_choice_question_url(@multiple_choice_question), notice: "Multiple choice question was successfully created." }
        format.json { render :show, status: :created, location: @multiple_choice_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @multiple_choice_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multiple_choice_questions/1 or /multiple_choice_questions/1.json
  def update
    respond_to do |format|
      if @multiple_choice_question.update(multiple_choice_question_params)
        format.html { redirect_to multiple_choice_question_url(@multiple_choice_question), notice: "Multiple choice question was successfully updated." }
        format.json { render :show, status: :ok, location: @multiple_choice_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @multiple_choice_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multiple_choice_questions/1 or /multiple_choice_questions/1.json
  def destroy
    @multiple_choice_question.destroy

    respond_to do |format|
      format.html { redirect_to multiple_choice_questions_url, notice: "Multiple choice question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiple_choice_question
      @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multiple_choice_question_params
      params.require(:multiple_choice_question).permit(:question, :possiblePoints)
    end
end
