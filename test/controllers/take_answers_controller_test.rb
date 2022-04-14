require "test_helper"

class TakeAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @take_answer = take_answers(:one)
  end

  test "should get index" do
    get take_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_take_answer_url
    assert_response :success
  end

  test "should create take_answer" do
    assert_difference("TakeAnswer.count") do
      post take_answers_url, params: { take_answer: { take_test_id: @take_answer.take_test_id, user_answer: @take_answer.user_answer } }
    end

    assert_redirected_to take_answer_url(TakeAnswer.last)
  end

  test "should show take_answer" do
    get take_answer_url(@take_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_take_answer_url(@take_answer)
    assert_response :success
  end

  test "should update take_answer" do
    patch take_answer_url(@take_answer), params: { take_answer: { take_test_id: @take_answer.take_test_id, user_answer: @take_answer.user_answer } }
    assert_redirected_to take_answer_url(@take_answer)
  end

  test "should destroy take_answer" do
    assert_difference("TakeAnswer.count", -1) do
      delete take_answer_url(@take_answer)
    end

    assert_redirected_to take_answers_url
  end
end
