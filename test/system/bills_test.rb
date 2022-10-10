require "application_system_test_case"

class BillsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @bill = bills(:first) # Reference to the first fixture bill
  end
  
  test "Create new bill" do
    # Using the Devise helper we login as an employee
    sign_in users(:user01)

    # When we visit the Bills#index page
    # we expect to see a title with the text "Uploaded Bills"
    visit bills_path
    assert_selector "h1", text: "Uploaded Bills"

    # When we click on the link with the text "New bill"
    # we expect to land on a page with the title "New bill"
    click_on "Add New Bill"
    assert_selector "h1", text: "New bill"

    # When we fill in the reference number input with "Test bill"
    # and we click on "Create bill"
    fill_in "Reference number", with: "Test bill"
    fill_in "Amount in kWh", with: "100"
    click_on "Create Bill"

    # We expect to be back on the page with the title "Bills"
    # and to see our "Test bill" added to the list
    assert_selector "h1", text: "Bills"
    assert_text "Test bill"
  end

  test "Approve bill" do
    # Using the Devise helper we login as a manager
    sign_in users(:user02)

    # We visit the Bills#index page
    # we expect to see a title with the text "Uploaded Bills"
    visit bills_path
    assert_selector "h1", text: "Uploaded Bills"

    # We click on the first Edit/Approve button
    # and expect to land on a page where we can approve the bill
    click_on "Edit/Approve", match: :first
    assert_selector "h2", text: "Approve bill"

    # We click on Approve and expect to
    # land back on the bills page showing an approved bill
    click_on "Approve"
    assert_selector "td", text: "true"
  end
end
