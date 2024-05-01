require "application_system_test_case"

class InstructionSectionsTest < ApplicationSystemTestCase
  setup do
    @instruction_section = instruction_sections(:one)
  end

  test "visiting the index" do
    visit instruction_sections_url
    assert_selector "h1", text: "Instruction sections"
  end

  test "should create instruction section" do
    visit instruction_sections_url
    click_on "New instruction section"

    click_on "Create Instruction section"

    assert_text "Instruction section was successfully created"
    click_on "Back"
  end

  test "should update Instruction section" do
    visit instruction_section_url(@instruction_section)
    click_on "Edit this instruction section", match: :first

    click_on "Update Instruction section"

    assert_text "Instruction section was successfully updated"
    click_on "Back"
  end

  test "should destroy Instruction section" do
    visit instruction_section_url(@instruction_section)
    click_on "Destroy this instruction section", match: :first

    assert_text "Instruction section was successfully destroyed"
  end
end
