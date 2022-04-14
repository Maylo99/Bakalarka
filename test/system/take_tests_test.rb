require "application_system_test_case"

class TakeTestsTest < ApplicationSystemTestCase
  setup do
    @take_test = take_tests(:one)
  end

  test "visiting the index" do
    visit take_tests_url
    assert_selector "h1", text: "Take tests"
  end

  test "should create take test" do
    visit take_tests_url
    click_on "New take test"

    fill_in "Gets points", with: @take_test.gets_points
    fill_in "Test", with: @take_test.test_id
    fill_in "User", with: @take_test.user_id
    click_on "Create Take test"

    assert_text "Take test was successfully created"
    click_on "Back"
  end

  test "should update Take test" do
    visit take_test_url(@take_test)
    click_on "Edit this take test", match: :first

    fill_in "Gets points", with: @take_test.gets_points
    fill_in "Test", with: @take_test.test_id
    fill_in "User", with: @take_test.user_id
    click_on "Update Take test"

    assert_text "Take test was successfully updated"
    click_on "Back"
  end

  test "should destroy Take test" do
    visit take_test_url(@take_test)
    click_on "Destroy this take test", match: :first

    assert_text "Take test was successfully destroyed"
  end
end
