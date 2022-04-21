class  TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy ]

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    @test.open_questions.build
    @test.multiple_choice_questions.build.choices.build

  end


  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to test_url(@test), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to test_url(@test), notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    # @test=Test.find(params[:test_id])
    # @open_question=OpenQuestion.find(params[:id])
    # if @open_question.destroy
    #   flash[:notice]="Uspesne zmazane"
    #   redirect_to @test
    # else
    #   flash[:error]="Nepodarilo sa"
    #   render :show
    #   end
    # end
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).
            permit(:totalPoints, :title,:_destroy, open_questions_attributes: [:id, :question, :points, :_destroy,:correctAnswer],
                   multiple_choice_questions_attributes:[:id,:question,:_destroy,:possiblePoints,
                                                         choices_attributes:[:id,:_destroy,:partialPoints,:answer,:is_true]])
    end
end
