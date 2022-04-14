require "application_system_test_case"

class TakeAnswersTest < ApplicationSystemTestCase
  setup do
    @take_answer = take_answers(:one)
  end

  test "visiting the index" do
    visit take_answers_url
    assert_selector "h1", text: "Take answers"
  end

  test "should create take answer" do
    visit take_answers_url
    click_on "New take answer"

    fill_in "Take test", with: @take_answer.take_test_id
    fill_in "User answer", with: @take_answer.user_answer
    click_on "Create Take answer"

    assert_text "Take answer was successfully created"
    click_on "Back"
  end

  test "should update Take answer" do
    visit take_answer_url(@take_answer)
    click_on "Edit this take answer", match: :first

    fill_in "Take test", with: @take_answer.take_test_id
    fill_in "User answer", with: @take_answer.user_answer
    click_on "Update Take answer"

    assert_text "Take answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Take answer" do
    visit take_answer_url(@take_answer)
    click_on "Destroy this take answer", match: :first

    assert_text "Take answer was successfully destroyed"
  end
end
