require "application_system_test_case"

class MultipleChoiceQuestionsTest < ApplicationSystemTestCase
  setup do
    @multiple_choice_question = multiple_choice_questions(:one)
  end

  test "visiting the index" do
    visit multiple_choice_questions_url
    assert_selector "h1", text: "Multiple choice questions"
  end

  test "should create multiple choice question" do
    visit multiple_choice_questions_url
    click_on "New multiple choice question"

    fill_in "Possiblepoints", with: @multiple_choice_question.possiblePoints
    fill_in "Question", with: @multiple_choice_question.question
    click_on "Create Multiple choice question"

    assert_text "Multiple choice question was successfully created"
    click_on "Back"
  end

  test "should update Multiple choice question" do
    visit multiple_choice_question_url(@multiple_choice_question)
    click_on "Edit this multiple choice question", match: :first

    fill_in "Possiblepoints", with: @multiple_choice_question.possiblePoints
    fill_in "Question", with: @multiple_choice_question.question
    click_on "Update Multiple choice question"

    assert_text "Multiple choice question was successfully updated"
    click_on "Back"
  end

  test "should destroy Multiple choice question" do
    visit multiple_choice_question_url(@multiple_choice_question)
    click_on "Destroy this multiple choice question", match: :first

    assert_text "Multiple choice question was successfully destroyed"
  end
end
