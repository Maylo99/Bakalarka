require "test_helper"

class TakeTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @take_test = take_tests(:one)
  end

  test "should get index" do
    get take_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_take_test_url
    assert_response :success
  end

  test "should create take_test" do
    assert_difference("TakeTest.count") do
      post take_tests_url, params: { take_test: { gets_points: @take_test.gets_points, test_id: @take_test.test_id, user_id: @take_test.user_id } }
    end

    assert_redirected_to take_test_url(TakeTest.last)
  end

  test "should show take_test" do
    get take_test_url(@take_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_take_test_url(@take_test)
    assert_response :success
  end

  test "should update take_test" do
    patch take_test_url(@take_test), params: { take_test: { gets_points: @take_test.gets_points, test_id: @take_test.test_id, user_id: @take_test.user_id } }
    assert_redirected_to take_test_url(@take_test)
  end

  test "should destroy take_test" do
    assert_difference("TakeTest.count", -1) do
      delete take_test_url(@take_test)
    end

    assert_redirected_to take_tests_url
  end
end
