require "test_helper"

class InstructionSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instruction_section = instruction_sections(:one)
  end

  test "should get index" do
    get instruction_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_instruction_section_url
    assert_response :success
  end

  test "should create instruction_section" do
    assert_difference("InstructionSection.count") do
      post instruction_sections_url, params: { instruction_section: {  } }
    end

    assert_redirected_to instruction_section_url(InstructionSection.last)
  end

  test "should show instruction_section" do
    get instruction_section_url(@instruction_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_instruction_section_url(@instruction_section)
    assert_response :success
  end

  test "should update instruction_section" do
    patch instruction_section_url(@instruction_section), params: { instruction_section: {  } }
    assert_redirected_to instruction_section_url(@instruction_section)
  end

  test "should destroy instruction_section" do
    assert_difference("InstructionSection.count", -1) do
      delete instruction_section_url(@instruction_section)
    end

    assert_redirected_to instruction_sections_url
  end
end
