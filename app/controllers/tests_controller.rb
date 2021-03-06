class  TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy ]

  # GET /tests or /tests.json
  def index
    @tests = Test.all
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
  end

  # GET /tests/1 or /tests/1.json
  def show
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
  end

  # GET /tests/new
  def new
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
    @test = Test.new
    @test.open_questions.build
    @test.multiple_choice_questions.build.choices.build

  end


  # GET /tests/1/edit
  def edit
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
  end

  # POST /tests or /tests.json
  def create
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
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
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
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
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
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
