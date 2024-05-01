require "application_system_test_case"

class NutritionsTest < ApplicationSystemTestCase
  setup do
    @nutrition = nutritions(:one)
  end

  test "visiting the index" do
    visit nutritions_url
    assert_selector "h1", text: "Nutritions"
  end

  test "should create nutrition" do
    visit nutritions_url
    click_on "New nutrition"

    click_on "Create Nutrition"

    assert_text "Nutrition was successfully created"
    click_on "Back"
  end

  test "should update Nutrition" do
    visit nutrition_url(@nutrition)
    click_on "Edit this nutrition", match: :first

    click_on "Update Nutrition"

    assert_text "Nutrition was successfully updated"
    click_on "Back"
  end

  test "should destroy Nutrition" do
    visit nutrition_url(@nutrition)
    click_on "Destroy this nutrition", match: :first

    assert_text "Nutrition was successfully destroyed"
  end
end
