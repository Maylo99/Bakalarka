require "application_system_test_case"

class ComentarsTest < ApplicationSystemTestCase
  setup do
    @comentar = comentars(:one)
  end

  test "visiting the index" do
    visit comentars_url
    assert_selector "h1", text: "Comentars"
  end

  test "should create comentar" do
    visit comentars_url
    click_on "New comentar"

    fill_in "Date", with: @comentar.date
    fill_in "Text", with: @comentar.text
    fill_in "User", with: @comentar.user_id
    fill_in "Video", with: @comentar.video_id
    click_on "Create Comentar"

    assert_text "Comentar was successfully created"
    click_on "Back"
  end

  test "should update Comentar" do
    visit comentar_url(@comentar)
    click_on "Edit this comentar", match: :first

    fill_in "Date", with: @comentar.date
    fill_in "Text", with: @comentar.text
    fill_in "User", with: @comentar.user_id
    fill_in "Video", with: @comentar.video_id
    click_on "Update Comentar"

    assert_text "Comentar was successfully updated"
    click_on "Back"
  end

  test "should destroy Comentar" do
    visit comentar_url(@comentar)
    click_on "Destroy this comentar", match: :first

    assert_text "Comentar was successfully destroyed"
  end
end
