require "test_helper"

class NutritionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nutrition = nutritions(:one)
  end

  test "should get index" do
    get nutritions_url
    assert_response :success
  end

  test "should get new" do
    get new_nutrition_url
    assert_response :success
  end

  test "should create nutrition" do
    assert_difference("Nutrition.count") do
      post nutritions_url, params: { nutrition: {  } }
    end

    assert_redirected_to nutrition_url(Nutrition.last)
  end

  test "should show nutrition" do
    get nutrition_url(@nutrition)
    assert_response :success
  end

  test "should get edit" do
    get edit_nutrition_url(@nutrition)
    assert_response :success
  end

  test "should update nutrition" do
    patch nutrition_url(@nutrition), params: { nutrition: {  } }
    assert_redirected_to nutrition_url(@nutrition)
  end

  test "should destroy nutrition" do
    assert_difference("Nutrition.count", -1) do
      delete nutrition_url(@nutrition)
    end

    assert_redirected_to nutritions_url
  end
end
