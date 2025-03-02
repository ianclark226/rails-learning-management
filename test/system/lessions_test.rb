require "application_system_test_case"

class LessionsTest < ApplicationSystemTestCase
  setup do
    @lession = lessions(:one)
  end

  test "visiting the index" do
    visit lessions_url
    assert_selector "h1", text: "Lessions"
  end

  test "should create lession" do
    visit lessions_url
    click_on "New lession"

    fill_in "Course", with: @lession.course_id
    fill_in "Description", with: @lession.description
    check "Paid" if @lession.paid
    fill_in "Title", with: @lession.title
    click_on "Create Lession"

    assert_text "Lession was successfully created"
    click_on "Back"
  end

  test "should update Lession" do
    visit lession_url(@lession)
    click_on "Edit this lession", match: :first

    fill_in "Course", with: @lession.course_id
    fill_in "Description", with: @lession.description
    check "Paid" if @lession.paid
    fill_in "Title", with: @lession.title
    click_on "Update Lession"

    assert_text "Lession was successfully updated"
    click_on "Back"
  end

  test "should destroy Lession" do
    visit lession_url(@lession)
    click_on "Destroy this lession", match: :first

    assert_text "Lession was successfully destroyed"
  end
end
