require "application_system_test_case"

class BillsTest < ApplicationSystemTestCase
  setup do
    @bill = bills(:first) # Reference to the first fixture bill
  end

  test "Create new bill" do
    # When we visit the Bills#index page
    # we expect to see a title with the text "Bills"
    visit bills_path
    assert_selector "h1", text: "Bills"

    # When we click on the link with the text "New bill"
    # we expect to land on a page with the title "New bill"
    click_on "New bill"
    assert_selector "h1", text: "New bill"

    # When we fill in the name input with "Test bill"
    # and we click on "Create bill"
    fill_in "Reference number", with: "Test bill"
    fill_in "Amount in euros", with: "100"
    click_on "Create Bill"

    # We expect to be back on the page with the title "Bills"
    # and to see our "Test bill" added to the list
    assert_selector "h1", text: "Bills"
    assert_text "Test bill"
  end
end
