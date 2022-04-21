class TakeTestsController < ApplicationController
  before_action :set_take_test, only: %i[ show edit update destroy ]
  before_action :current_user

  # GET /take_tests or /take_tests.json
  def index
    @tests = Test.all
  end

  # GET /take_tests/1 or /take_tests/1.json
  def show

  end

  # GET /take_tests/new
  def new
    @take_test = TakeTest.new
    @take_test.take_answers.build
    @take_test.take_multiple_choices.build
    @take_test.user_id=session[:user_id]
    @take_test.test_id=params[:test_id]
    session[:test_id]=params[:test_id]
  end

  # GET /take_tests/1/edit
  def edit
  end

  def show_my_tests
    @take_tests=TakeTest.where(user_id: session[:user_id])
  end

  # POST /take_tests or /take_tests.json
  def create
    @take_test = TakeTest.new(take_test_params)
    @take_test.test_id=session[:test_id]
    @take_test.take_answers.each do |a|
      open_q=OpenQuestion.find_by(id: a.question_id)
      if(open_q.correctAnswer==a.user_answer)
        @take_test.increment(:gets_points, open_q.points.to_i)
      end
    end

    @take_test.take_multiple_choices.each do |ch|
      choice=Choice.find_by(id: ch.choice_id)
      if(ch.choice.to_i !=0)
        @take_test.increment(:gets_points, choice.partialPoints)
      end
    end

    # raise @take_test.take_multiple_choices.inspect

    respond_to do |format|
      if @take_test.save
        format.html { redirect_to take_test_url(@take_test), notice: "Take test was successfully created." }
        format.json { render :show, status: :created, location: @take_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @take_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /take_tests/1 or /take_tests/1.json
  def update
    respond_to do |format|
      if @take_test.update(take_test_params)
        format.html { redirect_to take_test_url(@take_test), notice: "Take test was successfully updated." }
        format.json { render :show, status: :ok, location: @take_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @take_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /take_tests/1 or /take_tests/1.json
  def destroy
    @take_test.update(:user_id=>nil)
    @take_test.update(:test_id=>nil)
    @take_test.destroy

    respond_to do |format|
      format.html { redirect_to take_tests_url, notice: "Take test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_take_test
      @take_test = TakeTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def take_test_params
      params.require(:take_test).permit(:gets_points, :user_id, :test_id,
                                        take_answers_attributes: [:user_answer, :question_id],
                                        take_multiple_choices_attributes: [:choice, :is_correct,:choice_id])
    end
end
