require "test_helper"

class MultipleChoiceQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multiple_choice_question = multiple_choice_questions(:one)
  end

  test "should get index" do
    get multiple_choice_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_multiple_choice_question_url
    assert_response :success
  end

  test "should create multiple_choice_question" do
    assert_difference("MultipleChoiceQuestion.count") do
      post multiple_choice_questions_url, params: { multiple_choice_question: { possiblePoints: @multiple_choice_question.possiblePoints, question: @multiple_choice_question.question } }
    end

    assert_redirected_to multiple_choice_question_url(MultipleChoiceQuestion.last)
  end

  test "should show multiple_choice_question" do
    get multiple_choice_question_url(@multiple_choice_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_multiple_choice_question_url(@multiple_choice_question)
    assert_response :success
  end

  test "should update multiple_choice_question" do
    patch multiple_choice_question_url(@multiple_choice_question), params: { multiple_choice_question: { possiblePoints: @multiple_choice_question.possiblePoints, question: @multiple_choice_question.question } }
    assert_redirected_to multiple_choice_question_url(@multiple_choice_question)
  end

  test "should destroy multiple_choice_question" do
    assert_difference("MultipleChoiceQuestion.count", -1) do
      delete multiple_choice_question_url(@multiple_choice_question)
    end

    assert_redirected_to multiple_choice_questions_url
  end
end
